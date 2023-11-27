//
//  DataManager.swift
//  Torch
//
//  Created by Parth Saxena on 6/13/23.
//

import Foundation
import Starscream

class WebSocketManager {
    
    static let shared = WebSocketManager()
    private var socket: WebSocket?
    private var isConnected: Bool = false
    private var requests: [String: SocketRequest] = [:]
    private let ID_LENGTH = 15
    private let SOCKET_URL = "wss://hdca468gyi.execute-api.us-west-2.amazonaws.com/dev/"
    
    var jsonData: Any?
    var sharableInfo: Any?
    
    private init() {
        self.connect()
    }
    
    func generateRequestID() -> String {
        guard let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement() else { return "" }
        return String((0 ..< ID_LENGTH).map{ _ in letters })
    }
    
    func connect() {
        
        if let url = URL(string: SOCKET_URL) {
            var request = URLRequest(url: url)
            request.timeoutInterval = 5 // sets the timeout for the connection
            socket = WebSocket(request: request)
            socket?.delegate = self
            socket?.connect()
        }
    }
    
    func sendData(socketRequest: SocketRequest) {
        
        let requestID = generateRequestID()
        requests[requestID] = socketRequest
        
        if (!isConnected) { return }
        
        let route = socketRequest.route
        let data = socketRequest.data
        
        var json: [String: Any] = ["action": route]
        data.forEach { key, value in
            json[key] = value
            json["request_id"] = requestID
        }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []), let jsonString = String(data: jsonData, encoding: .utf8) else { return }
        socket?.write(string: jsonString)
    }
}

extension WebSocketManager: WebSocketDelegate {
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
            
        case .connected(_):
            self.loadConnectedCase()
        case .disconnected(_, _):
            isConnected = false
            self.connect()
        case .text(let string):
            self.loadTextCase(string: string)
        case .binary(let data):
            print("[WebSocketManager] Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error?) {
        self.connect()
    }
    
    func loadConnectedCase() {
        
        isConnected = true
        for (id, request) in requests {
            self.requests.removeValue(forKey: id)
            self.sendData(socketRequest: request)
        }
    }
    
    func loadTextCase(string: String) {
        
        if let data = string.data(using: .utf8) {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                
                let jsonDict = jsonObject as? [String: Any] ?? [:]
                guard let requestID = jsonDict["request_id"] as? String else {
                    return
                }
                if self.requests.keys.contains(requestID) {
                    guard let completion = self.requests[requestID]?.completion else {
                        return
                    }
                    self.requests.removeValue(forKey: requestID)
                    completion(jsonDict)
                }
            }
        }
    }
}

