//
//  ViewController.swift
//  CURL denemesi
//
//  Created by Emin Türk on 6.09.2018.
//  Copyright © 2018 Emin Türk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup
import CoreData

class ViewController: UIViewController {
    var a : String = ""
    var b : String = ""
    var benimURL : String = ""
    
    var l : String = ""
    
    var linkDizisi : [ String ] = [ ]
    var anahtarKelimeDizisi : [ String ] = [ ]
    var manaDizisi : [ String ] = [ ]
    
    var temizBirDizi : [ String ] = [ ]
    var denemeSozluguDizisi = [DenemeSozlugum]()
    var baskaBirDizi = [DenemeSozlugum]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Lokasyon \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))")
        
        let request : NSFetchRequest<DenemeSozlugum> = DenemeSozlugum.fetchRequest()
        
        do{
           baskaBirDizi = try context.fetch(request)
           print("Sonuç : \(baskaBirDizi[0].cAnahtarKelime)")
        }catch{
            print("An error has occured")
        }
        
        
        
        
//        for nambure in 1..<2 {
//            var hedefURL = "http://bulmacasozlugu.net/liste/harf/J/sayfa/\(nambure)/"
//
//            print("HEDEF URL : \(hedefURL)")
//            a = ""
//            b = ""
//            benimURL = ""
//            l = ""
//            linkDizisi = []
//            anahtarKelimeDizisi = []
//            manaDizisi = []
//            temizBirDizi = []
//
//
//
//
//        // 1 - Burada sayfayı listeleyecez
//        let myURLString0 = hedefURL
//        guard let myURL0 = URL(string: myURLString0) else {
//            print("Error: \(myURLString0) doesn't seem to be a valid URL")
//            return
//        }
//
//        do {
//            let myHTMLString0 = try String(contentsOf: myURL0, encoding: .utf8)
//            sayfaListele(html: myHTMLString0)
//
//        } catch let error {
//            print("Error: \(error)")
//        }
//
//
//        // 2 - Burada linkleri alıyoruz
//
//        let myURLString = hedefURL
//        guard let myURL = URL(string: myURLString) else {
//            print("Error: \(myURLString) doesn't seem to be a valid URL")
//            return
//        }
//
//        do {
//            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
//
//            anotherFonksiyon(html: myHTMLString)
//
//            print("Link dizisi kaç tane : \(linkDizisi.count)")
//
//        } catch let error {
//            print("Error: \(error)")
//        }
//
//        // 3 - Burada anahtar kelimenin anlamını arıyoruz
//            for number in 0..<20 {
//
//                let myURLString2 = "\(linkDizisi[number])"
//                guard let myURL2 = URL(string: myURLString2) else {
//                    print("Error: \(myURLString2) doesn't seem to be a valid URL")
//                    return
//                }
//
//                do {
//                    let myHTMLString2 = try String(contentsOf: myURL2, encoding: .utf8)
//
//
//                    temizBirDizi = anlamFonksiyonu2(html: myHTMLString2)
//
//                    print("Temiz bir diziye gelen : \(temizBirDizi)")
//
//                    print("Temiz olan dizi : \(temizBirDizi.count)")
//
//
//           let newItem = DenemeSozlugum(context: self.context)
//
//              newItem.cAnahtarKelime = anahtarKelimeDizisi[number]
//
//                    if temizBirDizi.count == 1 {
//                        newItem.cMana1 = temizBirDizi[0]
//                    }else if temizBirDizi.count == 2{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                    }else if temizBirDizi.count == 3{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                    }else if temizBirDizi.count == 4{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                    }else if temizBirDizi.count == 5{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                    }else if temizBirDizi.count == 6{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                    }else if temizBirDizi.count == 7{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                    }else if temizBirDizi.count == 8{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                    }else if temizBirDizi.count == 9{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                    }else if temizBirDizi.count == 10{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                    }else if temizBirDizi.count == 11{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                    }else if temizBirDizi.count == 12{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                    }else if temizBirDizi.count == 13{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                    }else if temizBirDizi.count == 14{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                    }else if temizBirDizi.count == 15{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                    }else if temizBirDizi.count == 16{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                    }else if temizBirDizi.count == 17{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                        newItem.cMana17 = temizBirDizi[16]
//                    }else if temizBirDizi.count == 18{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                        newItem.cMana17 = temizBirDizi[16]
//                        newItem.cMana18 = temizBirDizi[17]
//                    }else if temizBirDizi.count == 19{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                        newItem.cMana17 = temizBirDizi[16]
//                        newItem.cMana18 = temizBirDizi[17]
//                        newItem.cMana19 = temizBirDizi[18]
//                    }else if temizBirDizi.count == 20{
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                        newItem.cMana17 = temizBirDizi[16]
//                        newItem.cMana18 = temizBirDizi[17]
//                        newItem.cMana20 = temizBirDizi[19]
//                    }else{
//
//                        newItem.cMana1 = temizBirDizi[0]
//                        newItem.cMana2 = temizBirDizi[1]
//                        newItem.cMana3 = temizBirDizi[2]
//                        newItem.cMana4 = temizBirDizi[3]
//                        newItem.cMana5 = temizBirDizi[4]
//                        newItem.cMana6 = temizBirDizi[5]
//                        newItem.cMana7 = temizBirDizi[6]
//                        newItem.cMana8 = temizBirDizi[7]
//                        newItem.cMana9 = temizBirDizi[8]
//                        newItem.cMana10 = temizBirDizi[9]
//                        newItem.cMana11 = temizBirDizi[10]
//                        newItem.cMana12 = temizBirDizi[11]
//                        newItem.cMana13 = temizBirDizi[12]
//                        newItem.cMana14 = temizBirDizi[13]
//                        newItem.cMana15 = temizBirDizi[14]
//                        newItem.cMana16 = temizBirDizi[15]
//                        newItem.cMana17 = temizBirDizi[16]
//                        newItem.cMana18 = temizBirDizi[17]
//                        newItem.cMana20 = temizBirDizi[19]
//
//
//                    }
//
//
//
//
//                                        denemeSozluguDizisi.append(newItem)
//
//
//                                        do{
//                                            try self.context.save()
//
//                                        }
//                                        catch
//                                        {
//                                            print("Error saving context")
//                                        }
//
//
//
//
//                } catch let error {
//                    print("Error: \(error)")
//                }
//            }
//
//
//
//
//
//
//        }
        
    }
    
    
    // 1
    func sayfaListele(html : String) {
        
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let links: Elements = try doc.select("a[href]") // a with href
            let pngs: Elements = try doc.select("img[src$=.png]")
            // img with src ending .png
            let masthead: Element? = try doc.select("ul.nav-stacked").first()
            // div with class=masthead
            
            let resultLinks: Elements? = try doc.select("h3.r > a") // direct a after h3
            
            let links3 = try masthead?.children().array()
            
            print(links3?.count)
            
            for number in 0..<links3!.count {
                if try links3?[number].text().isEmpty == false
                {
                    anahtarKelimeDizisi.append(try links3![number].text())
                }
                
                
            }
            print("Anahtar Kelime Dizisi : \(anahtarKelimeDizisi)")
            print("Anahtar Kelime Dizisi Kaç Tane : \(anahtarKelimeDizisi.count)")
            
            
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
    }
    // 2
    func anotherFonksiyon(html: String) {

        do {

            let doc: Document = try SwiftSoup.parse(html)

            let link2: Element = try doc.select("a").get(39)
            let link2Href: String = try link2.attr("href")

            for number in 39..<59 {
                let link2: Element = try doc.select("a").get(number)
                let link2Href: String = try link2.attr("href")
                linkDizisi.append("http://www.bulmacasozlugu.net/\(link2Href)")

            }
            
        } catch Exception.Error(let type, let message) {
            print(message)
            
        } catch {
            print("error")
           
        }
    }
    // 3
    func anlamFonksiyonu2(html : String) -> [ String ] {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let links: Elements = try doc.select("a[href]") // a with href
            let pngs: Elements = try doc.select("img[src$=.png]")
            // img with src ending .png
            let masthead: Element? = try doc.select("blockquote.goster").first()
            // div with class=masthead

            let resultLinks: Elements? = try doc.select("h3.r > a") // direct a after h3

            let links2 = try masthead?.children().array()

            print("links2 kaç dane: \(links2?.count)")
            
            manaDizisi = []
            
            for number in 1..<links2!.count {
                if try links2?[number].text().isEmpty == false
                {
                   
                   
                    manaDizisi.append("\(try links2![number].text())")
                   
                    print("Döngünün içerisindeki mana dizisi : \(manaDizisi.count)")
                    
                    
                }
                
               
            }
          return manaDizisi
        } catch Exception.Error(let type, let message) {
            print(message)
            return ["Error"]
        } catch {
            print("error")
            return ["Error"]
        }
        
        
    }

}

