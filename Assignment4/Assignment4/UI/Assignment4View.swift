import SwiftUI

struct Assignment4View: View {
    @State private var expression: String = ""
    @State private var yearMonth: DateComponents = Calendar.current.dateComponents([.year, .month], from: Date())
    @State private var result: String = ""
    @State private var monthYear: String = ""
    @State private var cal: [[Int]] = CalendarGenerator().generate(yearAndMonth: Calendar.current.dateComponents([.year, .month], from: Date()))
    
    @State private var calstring: String = ""
    
    private func changeString() {
        var r = ""
        for row in cal {
            r += row.map { String(format: "%2d", $0) }.joined(separator: " ") + "\n"
        }
         calstring = r.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func evaluate() {
        do {
            result = try PostfixCalculator().parse(expression: expression).description
        } catch {
            result = "Error!"
        }
    }
    
    
    private func getlabel() {
            let dateFormatter = DateFormatter()
            monthYear = dateFormatter.monthSymbols[yearMonth.month! - 1] + " " + yearMonth.year!.description
    }
    
    private func generate() {
            cal = CalendarGenerator().generate(yearAndMonth: yearMonth)
            changeString()
    }
    private func prev() {
        do {
            yearMonth.month = yearMonth.month! - 1
            if (yearMonth.month == 0) {
                yearMonth.month = 12
                yearMonth.year! -= 1
            }
            generate()
            getlabel()
        }
    }
    
    private func today() {
    
            yearMonth.month = Calendar.current.component(.month, from: Date())
            yearMonth.year = Calendar.current.component(.year, from: Date())
            generate()
            getlabel()
    }
        
    private func next() {
        do {
            yearMonth.month = yearMonth.month! + 1
            if (yearMonth.month == 13) {
                yearMonth.month = 1
                yearMonth.year! += 1
            }
            getlabel()
            generate()
        }
    }
    
    
    var body: some View {
        VStack() {
            VStack {
                Label("Postfix Calculator", systemImage: "")
                VStack() {
                    TextField("Expression", text: $expression, onCommit: {evaluate()})
                        .textFieldStyle(.roundedBorder)
                    TextField("Result", text: $result)
                        .disabled(true)
                        .textFieldStyle(.roundedBorder)
                        .accessibilityHint(Text("Result"))
                    HStack {
                        Button("Evaluate", action: evaluate)
                        Button("Clear",
                               action: {self.expression = ""
                            self.result = ""
                        })
                    }
                }
                VStack() {
                    Label("Calendar Generator", systemImage: "").padding(.top, 150)
                    TextField("", text: $monthYear)
                            .onAppear(perform: getlabel)
                            .disabled(true)
                            .multilineTextAlignment(.center)
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .accessibilityLabel("Month")
                    // next texteditor is based on chatgpt code
                    TextEditor(text: $calstring).disabled(true)
                                        .multilineTextAlignment(.center)
                                        .font(.system(.body, design: .monospaced))
                                        .lineSpacing(0)
                                        .frame(height: 150)
                                        .accessibilityLabel("Calendar")
                                        .onAppear(perform: changeString)
                                        
                               
                    HStack {
                        Button("Previous", action: prev)
                        Button("Today", action: today)
                        Button("Next", action: next)
                    }
                    
                }
            }
            .padding(.vertical, 0)
           // Spacer()
        }
        .padding()
    }
}
    
#if !TESTING
    struct Assignment4View_Previews: PreviewProvider {
        static var previews: some View {
            Assignment4View()
        }
    }
#endif
