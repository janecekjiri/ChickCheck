//
//  DateFormView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DateFormView: View {
    @Binding var date: Date
    @State private var showDatePicker = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Datum label
            HStack {
                Text("date")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            // Pole pro datum, tlačítko
            HStack(spacing: 10) {
                // Pole pro datum
                ZStack {
                    Color.pinkRose
                        .frame(height: 50)
                        .cornerRadius(5)
                    
                    HStack {
                        Text(verbatim: self.date.formatted(.dateTime.day(.defaultDigits).month().year()))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
                
                // Tlačítko
                Image("calendar")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(Color.pinkRose)
                    .cornerRadius(5)
                    .onTapGesture {
                        withAnimation {
                            self.showDatePicker.toggle()
                        }
                    }
            }
            
            Spacer()
                .frame(height: 5)
            
            // Text pod polem
            HStack {
                Text("date_picker_helper_message")
                    .font(.footnote)
                
                Spacer()
            }
            
            if self.showDatePicker {
                DatePicker("", selection: $date, in: ...Date.now, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
        }
    }
}

#Preview {
    @State var date = Date.now
    return DateFormView(date: $date)
}
