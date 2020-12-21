//
//  PlayerView.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import SwiftUI
import SafariServices
import CoreData

struct PlayerView: View {
    @State var link: URL
    
    var body: some View {
        SafariView(url:self.link)
    }

}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(link: URL(string:"https://www.youtube.com/watch?v=RZ0jBbSofXs")!)
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}
