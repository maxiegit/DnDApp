import SwiftUI

struct BackgroundDetailView: View {

    @StateObject var backgroundModel = BackgroundViewModel()
    @Environment(\.presentationMode) var presentaionMode
    @State var presentEditScreen = false

    var background: Background

    var body: some View {
        VStack {
            Form {
                Group {
                    Section(header: Text("Name"), content: {
                        Text(background.name)
                    })

                    Section(header: Text("Skill proficiencies"), content: {
                        List {
                            ForEach(background.skillProf, id: \.self) { skill in
                                Text(skill)
                            }
                        }
                    })
                    Section(header: Text("Tool proficiencies"), content: {
                        List {
                            ForEach(background.toolProf, id: \.self) { tool in
                                Text(tool)
                            }
                        }
                    })
                    Section(header: Text("Language proficiencies"), content: {
                        Text(background.languages)
                    })
                    Section(header: Text("Equipment"), content: {
                        Text(background.equipment)
                    })
                    Section(header: Text("Feature"), content: {
                        Text(background.feature)
                    })
                    Section(header: Text("Ability"), content: {
                        Text(background.ability)
                    })
                }

                Section(header: Text("Specialty"), content: {
                    List {
                        ForEach(0..<background.specialty.count) { i in
                            HStack {
                                Text("\(i + 1)")
                                Divider()
                                Text(background.specialty[i])
                            }
                        }
                    }
                })
                Section(header: Text("Suggested Personality"), content: {
                    List {
                        ForEach(0..<background.suggestedPersonality.count) { i in
                            HStack {
                                Text("\(i + 1)")
                                Divider()
                                Text(background.suggestedPersonality[i])
                            }
                        }
                    }
                })
                Section(header: Text("Suggested Ideals"), content: {
                    List {
                        ForEach(0..<background.suggestedIdeal.count) { i in
                            HStack {
                                Text("\(i + 1)")
                                Divider()
                                Text(background.suggestedIdeal[i])
                            }
                        }
                    }
                })
                Section(header: Text("Suggested Bonds"), content: {
                    List {
                        ForEach(0..<background.suggestedBond.count) { i in
                            HStack {
                                Text("\(i + 1)")
                                Divider()
                                Text(background.suggestedBond[i])
                            }
                        }
                    }
                })
                Section(header: Text("Suggested Flaws"), content: {
                    List {
                        ForEach(0..<background.suggestedFlaw.count) { i in
                            HStack {
                                Text("\(i + 1)")
                                Divider()
                                Text(background.suggestedFlaw[i])
                            }
                        }
                    }
                })
            }
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditBackground(backgroundModel: BackgroundViewModel(background: background), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentaionMode.wrappedValue.dismiss()
                }
            }
        })
    }

    func cancel() {
        dismiss()
    }

    func done() {
        dismiss()
    }

    func dismiss() {
        presentaionMode.wrappedValue.dismiss()
    }

    struct BackgroundDetail_Previews: PreviewProvider {
        static var previews: some View {
            let background = Background(
                name: "Hermit",
                skillProf: ["Medcine", "Religion"],
                toolProf: ["Herbalism Kit"],
                languages: "One of your choice",
                equipment: "A scroll case stuffed full of notes from your studies or prayers, a winter blanket, a set of common clothes, an herbalism kit, and 5 gp",
                feature: "The quiet seclusion of your extended hermitage gave you access to a unique and powerful discovery. The exact nature of this revelation depends on the nature of your seclusion. It might be a great truth about the cosmos, the deities, the powerful beings of the outer planes, or the forces of nature. It could be a site that no one else has ever seen. You might have uncovered a fact that has long been forgotten, or unearthed some relic of the past that could rewrite history. It might be information that would be damaging to the people who or consigned you to exile, and hence the reason for your return to society. Work with your DM to determine the details of your discovery and its impact on the campaign.",
                ability: "",
                specialty: ["I was searching for spiritual enlightenment.", "I was partaking of communal living in accordance with the dictates of a religious order.", "I was exiled for a crime I didn't commit.", "I retreated from society after a life-altering event.", "I needed a quiet place to work on my art, literature, music, or manifesto.", "I needed to commune with nature, far from civilization.", "I was the caretaker of an ancient ruin or relic.", "I was a pilgrim in search of a person, place, or relic of spiritual significance."],
                suggestedPersonality: ["I've been isolated for so long that I rarely speak, preferring gestures and the occasional grunt.", "I am utterly serene, even in the face of disaster."],
                suggestedIdeal: [],
                suggestedBond: [],
                suggestedFlaw: [])

            BackgroundDetailView(background: background)
        }
    }
}
