// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require rails-ujs

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
import "script.js"
import Swiper from 'swiper/swiper-bundle.js';  
import 'swiper/swiper-bundle.css';　　　　　　　

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

$('.single-item').slick();

$(function() {
    $('.a').slick({
        dots: true,
    });
});

