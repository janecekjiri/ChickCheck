//
//  DateFormView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DateFormView: View {
    @Binding var date: Date
    @Binding var isDatePickerVisible: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Date label
            HStack {
                Text("date")
                    .font(.title)
                    .fontWeight(.bold)
                    .accessibilityAddTraits(.isStaticText)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            // Date field, button
            HStack(spacing: 10) {
                // Date field
                ZStack {
                    Color.pinkRose
                        .frame(height: 50)
                        .cornerRadius(5)
                    
                    HStack {
                        Text(verbatim: self.date.formatted(.dateTime.day(.defaultDigits).month().year()))
                            .font(.title2)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .accessibilityAddTraits(.isStaticText)
                            .accessibilityHint("date_text_field_accessibility_hint")
                        
                        Spacer()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
                
                // Button
                Image("calendar")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(Color.pinkRose)
                    .cornerRadius(5)
                    .onTapGesture {
                        withAnimation {
                            self.isDatePickerVisible.toggle()
                        }
                    }
                    .accessibilityRemoveTraits(.isImage)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityLabel("calendar_button_label")
                    .accessibilityHint("calendar_button_hint")
            }
            
            Spacer()
                .frame(height: 5)
            
            // Text below field
            HStack {
                Text("date_picker_helper_message")
                    .font(.footnote)
                    .accessibilityHidden(true)
                
                Spacer()
            }
            
            if self.isDatePickerVisible {
                DatePicker("", selection: $date, in: ...Date.now, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
        }
    }
}

#Preview {
    @State var date = Date.now
    @State var isVisible = false
    return DateFormView(date: $date, isDatePickerVisible: $isVisible)
}
