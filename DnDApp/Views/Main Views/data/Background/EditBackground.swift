import SwiftUI

struct EditBackground: View {

    @StateObject var backgroundModel = BackgroundViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var presentActionSheet = false

    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?

    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Group {
                        Section(header: Text("Name"), content: {
                            TextField("Name", text: $backgroundModel.background.name)
                        })
                        Section(header: HStack {
                            Text("Skill Prof")
                            Spacer()
                            Button(action: {
                                    backgroundModel.background.skillProf.append("")
                            }, label: {
                                Image(systemName: "plus")
                                    .font(.headline)
                                        })
                                    }, content: {
                            List {
                                ForEach(backgroundModel.background.skillProf, id: \.self) { skill in
                                    EditorView(container: $backgroundModel.background.skillProf, index: backgroundModel.background.skillProf.firstIndex(of: skill)!, text: skill)
                                }
                                .onDelete(perform: deleteSkill)
                            }

                        })
                        Section(header: HStack {
                            Text("Tool Prof")
                            Spacer()
                            Button(action: {
                                    backgroundModel.background.toolProf.append("")
                            }, label: {
                                Image(systemName: "plus")
                                    .font(.headline)
                                        })
                                    }, content: {
                            List {
                                ForEach(backgroundModel.background.toolProf, id: \.self) { tool in
                                    EditorView(container: $backgroundModel.background.toolProf, index: backgroundModel.background.toolProf.firstIndex(of: tool)!, text: tool)
                                }
                                .onDelete(perform: deleteTool)
                            }
                        })
                        Section(header: Text("Languages"), content: {
                            TextField("Languages", text: $backgroundModel.background.languages)
                        })
                        Section(header: Text("Equipment"), content: {
                            TextField("Equipment", text: $backgroundModel.background.equipment)
                        })
                        Section(header: Text("Feature"), content: {
                            TextEditor(text: $backgroundModel.background.feature)
                        })
                        Section(header: Text("Ability"), content: {
                            TextEditor(text: $backgroundModel.background.ability)
                        })
                    }

                    Section(header: HStack {
                        Text("Specialty")
                        Spacer()
                        Button(action: {
                            backgroundModel.background.specialty.append("")
                        }, label: {
                            Image(systemName: "plus")
                                .font(.headline)
                                    })
                    }, content: {
                        List {
                            ForEach(backgroundModel.background.specialty, id: \.self) { specialty in
                                EditorView(container: $backgroundModel.background.specialty, index: backgroundModel.background.specialty.firstIndex(of: specialty)!, text: specialty)
                            }
                            .onDelete(perform: deleteSpecialty)
                        }
                    })

                    Traits(backgroundModel: backgroundModel)

                    if mode == .edit {
                        Button(action: {self.presentActionSheet.toggle()}) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                }
                .background(Color.flatDarkBackground).ignoresSafeArea()
                .navigationTitle(mode == .new ? "New Background" : "Edit \(backgroundModel.background.name)")
                .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()},
                                                    label: {
                                                        Text("Cancel")
                                                    }),
                                    trailing: Button(action: {done()}, label: {
                                        Text("Done")
                                    }))
                .actionSheet(isPresented: $presentActionSheet, content: {
                    ActionSheet(title: Text("Are you sure?"),
                                buttons: [
                                    .destructive(Text("Delete background"),
                                                 action: { delete() }),
                                    .cancel()
                                ])
                })

            }
        }
    }

    func deleteSkill(at offsets: IndexSet) {
        backgroundModel.background.skillProf.remove(atOffsets: offsets)
    }

    func deleteTool(at offsets: IndexSet) {
        backgroundModel.background.toolProf.remove(atOffsets: offsets)
    }

    func deleteSpecialty(at offsets: IndexSet) {
        backgroundModel.background.specialty.remove(atOffsets: offsets)
    }

    func done() {
        if mode == .new {
            backgroundModel.addBackground()
        } else {
            backgroundModel.updateBackground()
        }
        self.presentationMode.wrappedValue.dismiss()
    }

    func delete() {
        backgroundModel.deleteBackground()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }}

struct Traits: View {

    @StateObject var backgroundModel = BackgroundViewModel()

    var body: some View {
        Section(header: HStack {
            Text("Suggested Personality")
            Spacer()
            Button(action: {
                    backgroundModel.background.suggestedPersonality.append("")
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
                        })
        }, content: {
            List {
                ForEach(backgroundModel.background.suggestedPersonality, id: \.self) { trait in
                    EditorView(container: $backgroundModel.background.suggestedPersonality, index: backgroundModel.background.suggestedPersonality.firstIndex(of: trait)!, text: trait)
                }
                .onDelete(perform: deletePersonality)

            }
        })
        Section(header: HStack {
            Text("Suggested Ideals")
            Spacer()
            Button(action: {
                backgroundModel.background.suggestedIdeal.append("")
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
                        })
                    }, content: {
            List {
                ForEach(backgroundModel.background.suggestedIdeal, id: \.self) { ideal in
                    EditorView(container: $backgroundModel.background.suggestedIdeal, index: backgroundModel.background.suggestedIdeal.firstIndex(of: ideal)!, text: ideal)
                }
                .onDelete(perform: deleteIdeal)

            }
        })
        Section(header: HStack {
            Text("Suggested Bonds")
            Spacer()
            Button(action: {
                backgroundModel.background.suggestedBond.append("")
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
                        })
                    }, content: {
            List {
                ForEach(backgroundModel.background.suggestedBond, id: \.self) { bond in
                    EditorView(container: $backgroundModel.background.suggestedBond, index: backgroundModel.background.suggestedBond.firstIndex(of: bond)!, text: bond)
                }
                .onDelete(perform: deleteBond)

            }
        })
        Section(header: HStack {
            Text("Suggested Flaws")
            Spacer()
            Button(action: {
                backgroundModel.background.suggestedFlaw.append("")
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
                        })
                    }, content: {
            List {
                ForEach(backgroundModel.background.suggestedFlaw, id: \.self) { flaw in
                    EditorView(container: $backgroundModel.background.suggestedFlaw, index: backgroundModel.background.suggestedFlaw.firstIndex(of: flaw)!, text: flaw)
                }
                .onDelete(perform: deleteFlaw)

            }
        })
    }

    func deletePersonality(at offsets: IndexSet) {
        backgroundModel.background.suggestedPersonality.remove(atOffsets: offsets)
    }

    func deleteBond(at offsets: IndexSet) {
        backgroundModel.background.suggestedBond.remove(atOffsets: offsets)
    }

    func deleteIdeal(at offsets: IndexSet) {
        backgroundModel.background.suggestedIdeal.remove(atOffsets: offsets)
    }

    func deleteFlaw(at offsets: IndexSet) {
        backgroundModel.background.suggestedFlaw.remove(atOffsets: offsets)
    }

}

struct EditBackground_Previews: PreviewProvider {
    static var previews: some View {
        EditBackground(backgroundModel: BackgroundViewModel(background: Background(
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
                                                                suggestedFlaw: [])))
    }

}
