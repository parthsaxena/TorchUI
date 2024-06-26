//
//  AuthenticationManager.swift
//  Torch
//
//  Created by Parth Saxena on 6/13/23.
//

import Foundation
import Amplify
import AWSCognitoAuthPlugin

//enum AuthState {
//    case signUp
//    case inputEmail
//    case inputPassword
//    case confirmEmailCode
//    case inputName
//
//    case login
//    case loginEmail
//    case loginPassword
//
//    case session(user: AuthUser)
//}

class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    
    @Published var authState: AuthState = .welcome
    @Published var authUser: AuthUser?
    @Published var authStateLoaded: Bool = false
    
    var email: String?
    var password: String?
    var deviceToken: String?
    
    init() {
        //
//        Task {
//            await fetchCurrentAuthSession()
//        }
    }
    
    func fetchCurrentAuthSession() async {
        do {
            let session = try await Amplify.Auth.fetchAuthSession()
            if session.isSignedIn {
                let user = try await Amplify.Auth.getCurrentUser()
//                Amplify.Analytics.identifyUser(userId: user.userId)
                try await Amplify.Notifications.Push.identifyUser(userId: user.userId)
                if self.deviceToken != nil {
                    SessionManager.shared.registerUserEndpoint(deviceToken: self.deviceToken!, userID: user.userId)
                    print("Identified user to Pinpoint0: \(user.userId)")
                }
                // print("Got user")
                    DispatchQueue.main.async {
                        self.authUser = user
                        self.authState = .authenticated
                        self.authStateLoaded = true
                    }
                    SessionManager.shared.loadUserProperties()
//                }
            } else {
                DispatchQueue.main.async {
                    self.authStateLoaded = true
                }
            }
        } catch let error as AuthError {
             print("Fetch session failed with error \(error)")
        } catch {
            // print("Unexpected error: \(error)")
        }
    }
    
    func signIn(email: String, password: String) async {
        do {
            let signInResult = try await Amplify.Auth.signIn(username: email, password: password)
            if signInResult.isSignedIn {
                
                let user = try await Amplify.Auth.getCurrentUser()
//                Amplify.Analytics.identifyUser(userId: user.userId)
                try await Amplify.Notifications.Push.identifyUser(userId: user.userId)
                SessionManager.shared.registerUserEndpoint(deviceToken: self.deviceToken ?? "", userID: user.userId)
                print("Identified user to Pinpoint1: \(user.userId)")
                // print("Got user")
                DispatchQueue.main.async {
                    self.authUser = user
                    self.authState = .authenticated
                    // Load property & device data
                }
                SessionManager.shared.loadUserProperties()
//                }
            }
        } catch let error as AuthError {
             print("Sign in failed \(error)")
        } catch {
            // print("Unexpected error: \(error)")
        }
    }
    
    func signupPostSignIn(email: String, password: String) async {
        do {
            let signInResult = try await Amplify.Auth.signIn(username: email, password: password)
            if signInResult.isSignedIn {
                
                let user = try await Amplify.Auth.getCurrentUser()
                // print("Got user")
                DispatchQueue.main.async {
                    self.authUser = user
                    SessionManager.shared.createUserData(email: email, deviceToken: self.deviceToken)
                    DispatchQueue.main.async {
                        SessionManager.shared.propertiesLoaded = true
                    }
                }
            }
        } catch let error as AuthError {
             print("Sign in failed \(error)")
        } catch {
            // print("Unexpected error: \(error)")
        }
    }
    
    func signUp(email: String, password: String) async {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        do {
            let signUpResult = try await Amplify.Auth.signUp(
                username: email,
                password: password,
                options: options
            )
            
            self.email = email
            self.password = password
            
            if case .confirmUser(_, _, _) = signUpResult.nextStep {
                DispatchQueue.main.async {
                    self.authState = .accountVerificationCode
                }
            } else {
                // print("SignUp Complete")
            }
        } catch let error as AuthError {
             print("An error occurred while registering a user \(error)")
        } catch {
            // print("Unexpected error: \(error)")
        }
    }
    
    func gotNewVerificationCode(code: String) async {
        
        await self.confirm(
            email: email ?? "",
            code: code
        )
    }
    
    func confirm(email: String, code: String) async {
        do {
            let confirmSignUpResult = try await Amplify.Auth.confirmSignUp(
                for: email,
                confirmationCode: code
            )
            // print("Confirm sign up result completed: \(confirmSignUpResult.isSignUpComplete)")
            if confirmSignUpResult.isSignUpComplete {
                await signupPostSignIn(email: email, password: password ?? "")
            }
        } catch let error as AuthError {
             print("An error occurred while confirming sign up \(error)")
        } catch {
            // print("Unexpected error: \(error)")
        }
    }
    
    func signOut() async {
        let result = await Amplify.Auth.signOut()
        
        guard let signOutResult = result as? AWSCognitoSignOutResult
        else {
            // print("Signout failed")
            return
        }
        
        // print("Local signout successful: \(signOutResult.signedOutLocally)")
        switch signOutResult {
        case .complete:
            // Sign Out completed fully and without errors.
            // print("Signed out successfully")
            SessionManager.shared.clearData()
            self.authState = .welcome
            
        case let .partial(revokeTokenError, globalSignOutError, hostedUIError):
            // Sign Out completed with some errors. User is signed out of the device.
            
            if let hostedUIError = hostedUIError {
                // print("HostedUI error  \(String(describing: hostedUIError))
            }
            
            if let globalSignOutError = globalSignOutError {
                // Optional: Use escape hatch to retry revocation of globalSignOutError.accessToken.
                // print("GlobalSignOut error  \(String(describing: globalSignOutError))
            }
            
            if let revokeTokenError = revokeTokenError {
                // Optional: Use escape hatch to retry revocation of revokeTokenError.accessToken.
                // print("Revoke token error  \(String(describing: revokeTokenError))
            }
            
        case .failed(let error):
            // Sign Out failed with an exception, leaving the user signed in.
            print("SignOut failed with \(error)")
        }
    }
}
