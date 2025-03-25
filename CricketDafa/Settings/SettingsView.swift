//
//  SettingsView.swift
//  CricketDafa
//
//  Created by D K on 25.03.2025.
//

import SwiftUI
import MessageUI


struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isFeedbackShown = false
    
    var body: some View {
        ZStack {
            BGView()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundStyle(.darkRed)
                            
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Text("Settings")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                    HStack {
                        
                    }
                    .frame(width: 35)
                }
                
                Button {
                    showPrivacy(url: "https://sites.google.com/view/daficricketmaster/contact-us")
                } label: {
                    HStack {
                        Image("contactIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 35)
                        
                        Text("Contact Us")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 45)
                .padding(.top)
                
                Button {
                    showPrivacy(url: "https://sites.google.com/view/daficricketmaster/privacy-policy")
                } label: {
                    HStack {
                        Image("privacyIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 35)
                        
                        Text("Privacy Policy")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 45)
                .padding(.top)
                
                Button {
                    if MFMailComposeViewController.canSendMail() {
                        isFeedbackShown.toggle()
                    } else {
                    }
                } label: {
                    HStack {
                        Image("feedbackIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                        
                        Text("Feedback")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.leading, 22)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 45)
                .padding(.top)
                .sheet(isPresented: $isFeedbackShown) {
                    MailComposeView(isShowing: $isFeedbackShown, subject: "Feedback", recipientEmail: "", textBody: "")
                }
                
                Spacer()
            }
        }
    }
    
    func showPrivacy(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}


struct MailComposeView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    let subject: String
    let recipientEmail: String
    let textBody: String
    var onComplete: ((MFMailComposeResult, Error?) -> Void)?
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.setSubject(subject)
        mailComposer.setToRecipients([recipientEmail])
        mailComposer.setMessageBody(textBody, isHTML: false)
        mailComposer.mailComposeDelegate = context.coordinator
        return mailComposer
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailComposeView
        
        init(_ parent: MailComposeView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            parent.isShowing = false
            parent.onComplete?(result, error)
        }
    }
}
