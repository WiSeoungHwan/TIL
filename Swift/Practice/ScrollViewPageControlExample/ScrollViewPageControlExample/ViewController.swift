//
//  ViewController.swift
//  ScrollViewPageControlExample
//
//  Created by Wi on 16/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    var slide1 = SlideView()
    var slide2 = SlideView()
    var slides: [SlideView] = []
    var colorNumber = 0
    let colors = [UIColor.red,UIColor.blue,UIColor.green,UIColor.black,UIColor.darkGray,UIColor.purple]
    var slideNum: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        slides = createSlides(6)
        createPageControl()
        createScrollView()
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        print(slides.count)
//        slideNum = slides.count - 1
        setupSlides()
        
        
    }
    
    private func setupSlides(){
        print(slides.endIndex)
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(slides.count),
            height: UIScreen.main.bounds.height
        )
    }
    private func createSlides(_ slideNumber: Int) -> [SlideView] {
        var slideArray: [SlideView] = []
        for _ in 1...slideNumber{
            let slide = SlideView()
            scrollView.addSubview(slide)
            slide.translatesAutoresizingMaskIntoConstraints = false
            slide.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
            slide.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
            slide.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
            slide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
//            slide.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            if(colorNumber > 5)
            {
                colorNumber = 0
                slide.backgroundColor = colors[colorNumber]
            }else{
                slide.backgroundColor = colors[colorNumber]
                colorNumber += 1
            }
            slideArray.append(slide)
        }
        return slideArray
    }
        
//        scrollView.addSubview(slide1)
//        scrollView.addSubview(slide2)
//        slide1.translatesAutoresizingMaskIntoConstraints = false
//        slide2.translatesAutoresizingMaskIntoConstraints = false
//        slide1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
//        slide1.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
//        slide1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
//        slide1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
//        slide1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
//        slide1.trailingAnchor.constraint(equalTo: slide2.leadingAnchor, constant: 0).isActive = true
//        slide1.backgroundColor = .red
//
//
//
//        slide2.backgroundColor = .green
        
    
    
    private func createPageControl(){
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    private func createScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.backgroundColor = .gray
    }
    

}
extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.frame.width)
    }
}


