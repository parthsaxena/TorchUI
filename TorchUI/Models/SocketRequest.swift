//
//  SocketRequest.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 27/11/2023.
//

import Foundation

struct SocketRequest {
    var route: String
    var data: [String: Any]
    var completion: (([String: Any]) -> ())?
}
