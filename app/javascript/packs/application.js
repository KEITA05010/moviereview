// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import '@fortawesome/fontawesome-free/js/all'
import "../stylesheets/application" 
import "../stylesheets/test"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


/*global $*/
$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});


/*global Swiper */
const swiper = new Swiper('.swiper', {
  //オプションの設定
  loop: true, //最後までスライドしたら最初の画像に戻る
 
  //ページネーション表示の設定
  pagination: { 
    el: '.swiper-pagination', //ページネーションの要素
  },
 
  //ナビゲーションボタン（矢印）表示の設定
  navigation: { 
    nextEl: '.swiper-button-next', //「次へボタン」要素の指定
    prevEl: '.swiper-button-prev', //「前へボタン」要素の指定
  }
});
