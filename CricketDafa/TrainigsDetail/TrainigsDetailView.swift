//
//  TrainigsDetailView.swift
//  CricketDafa
//
//  Created by D K on 24.03.2025.
//

import SwiftUI
import AVFoundation

struct TrainigsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var training: Training
    
    
    //step-by-step
    
    @State private var stepIndex: Int = 0
    
    //timer
    
    @State private var timeRemaining = 30 * 60 // 30 минут в секундах
    @State private var timerIsRunning = false
    @State private var timer: Timer?
    @State private var audioPlayer: AVAudioPlayer?
    
    @State private var index = 0
    
    
    var body: some View {
        ZStack {
            BGView()
            
            VStack {
                Image(training.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width, height: 180)
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 0))
                    .overlay {
                        ZStack {
                            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 0)
                                .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .leading, endPoint: .trailing))
                                .opacity(0.55)
                            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 0)
                                .stroke(lineWidth: 4)
                                .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                                                      
                            if timerIsRunning {
                                Text(formattedTime(timeRemaining))
                                    .font(.system(size: 60, weight: .bold, design: .monospaced))
                                    .foregroundStyle(.white)
                            } else {
                                Text(training.title)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 32, weight: .black))
                                    .padding(.horizontal)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .overlay {
                        VStack {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 15)
                        .padding(.leading, 15)
                    }
                
                
                switch index {
                case 0:
                    Text(training.longDescription)
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            index = 1
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.lightRed)
                                .frame(width: 280, height: 60)
                            Text("Step-By-Step Mode")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    
                    HStack {
                        Button {
                            withAnimation {
                                index = 2
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.darkRed)
                                    .frame(width: 150, height: 60)
                                Text("Full Training")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20, weight: .bold))
                            }
                        }
                        
                        Button {
                            if timerIsRunning {
                                stopTimer()
                            } else {
                                startTimer()
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.darkRed)
                                    .frame(width: 120, height: 60)
                                if timerIsRunning {
                                    Text("Stop Timer")
                                        .foregroundStyle(.white)
                                        .bold()
                                } else {
                                    HStack {
                                        Image(systemName: "timer")
                                            .foregroundStyle(.white)
                                        Text("30 Mins")
                                            .foregroundStyle(.white)
                                           
                                    }
                                    .bold()
                                }
                               
                            }
                        }
                    }

                    
                    Spacer()
                case 1:
                    VStack {
                        HStack {
                            Text("Step-By-Step")
                                .foregroundStyle(.white)
                                .font(.system(size: 30, weight: .bold))
                            
                            Button {
                                if timerIsRunning {
                                    stopTimer()
                                } else {
                                    startTimer()
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.darkRed)
                                        .frame(width: 120, height: 60)
                                    if timerIsRunning {
                                        Text("Stop Timer")
                                            .foregroundStyle(.white)
                                            .bold()
                                    } else {
                                        HStack {
                                            Image(systemName: "timer")
                                                .foregroundStyle(.white)
                                            Text("30 Mins")
                                                .foregroundStyle(.white)
                                               
                                        }
                                        .bold()
                                    }
                                   
                                }
                            }
                        }
                        .padding(.top)
                        
                        if let steps = training.steps {
                            GeometryReader { geometry in
                                TabView(selection: $stepIndex) {
                                    ForEach(0..<steps.count, id: \.self) { index in
                                        
                                        Text(steps[index].description)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 28, weight: .black))
                                            .padding()
                                            .multilineTextAlignment(.center)
                                            .background {
                                                RoundedRectangle(cornerRadius: 18)
                                                    .fill(LinearGradient(colors: [.darkRed, .lightRed, .darkRed, .lightRed], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .opacity(0.35)
                                                
                                                RoundedRectangle(cornerRadius: 18)
                                                    .stroke(lineWidth: 4)
                                                    .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                                            }
                                            .padding(.horizontal)
                                    }
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .frame(maxHeight: 290)
                            .padding(.top, -40)
                        }
                        
                        Spacer()

                        if stepIndex != (training.steps?.count ?? 10) - 1 {
                            Button {
                                withAnimation {
                                    stepIndex += 1
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.darkRed)
                                        .frame(width: 120, height: 60)
                                 
                                    Text("Next Step")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            .shadow(radius: 4)
                        } else {
                            Button {
                                stopTimer()
                                withAnimation {
                                    dismiss()
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.darkRed)
                                        .frame(width: 120, height: 60)
                                 
                                    Text("End Training")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            .shadow(radius: 4)
                        }
                       
                        
                        Spacer()
                    }
                case 2:
                    VStack(alignment: .leading) {
                        ScrollView {
                            Text("Full Training")
                                .foregroundStyle(.white)
                                .font(.system(size: 30, weight: .bold))
                                .padding(.vertical)
                            
                            if let steps = training.steps {
                                ForEach(steps, id: \.id) { step in
                                    Text("- \(step.description)")
                                        .foregroundStyle(.white)
                                        .frame(width: size().width - 40, alignment: .leading)
                                        .padding(.bottom)
                                        .font(.system(size: 20, weight: .bold))
                                }
                                
                            }
                            
                            Button {
                                withAnimation {
                                    index = 1
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.darkRed)
                                        .frame(width: 190, height: 60)
                                 
                                    Text("Start Step-By-Step")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            .shadow(radius: 4)
                            .padding(.top, 25)
                            .padding(.bottom, 55)
                        }
                        .scrollIndicators(.hidden)
                    }
                default: Text("")
                }
                
                
                
                
            }
        
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.async {
                prepareSound()
            }
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    
    
    //Timer Methods
    
    private func startTimer() {
        timerIsRunning = true
        timeRemaining = 30 * 60 // Сброс до 30 минут
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                playSound()
            }
        }
    }
    
    private func stopTimer() {
        timerIsRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    private func formattedTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    private func prepareSound() {
        guard let soundURL = Bundle.main.url(forResource: "svist", withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    private func playSound() {
        audioPlayer?.play()
    }
}

#Preview {
    TrainigsDetailView(training: DataManager.shared.trainings.first!)
}
