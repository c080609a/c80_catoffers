"use strict";

// Код, реализующий ajax функционал на странице "Наши Услуги"

var fOffersBindHistoryAdapter;
var fOffersdoAjaxRequest;
var fOffersProccessPaginateLinks;
var fOffersStartWillPaginateAjax;

$(function () {

   console.log('<offers_ajax>');

   var fOffersGetBlock = function () {
       return $('.ajax_div_offers');
   };

   var fOffersGetWillPaginateLinks = function () {
       return fOffersGetBlock().find(".div_will_paginate a");
   };
    
   if (fOffersGetBlock().length) {

       fOffersBindHistoryAdapter = function () {
           //noinspection JSUnresolvedVariable
           History.Adapter.bind(window,'statechange',function(){ // Note: We are using statechange instead of popstate

               // Log the State
               //noinspection JSUnresolvedFunction
               var State = History.getState(); // Note: We are using History.getState() instead of event.state
               var p;

               //History.log('statechange:', State.data, State.title, State.url);
               if (State.title == "") {
                   p = 1;
               } else {
                   p = State.data.page;
               }

               fOffersdoAjaxRequest(p);
           });
       };

       fOffersdoAjaxRequest = function (page/*integer*/,callback/*function*/) {

           var $ajax_div = fOffersGetBlock(); // к этому контейнеру изначально прикреплены кое-какие данные

           $.ajax({
               url: "/offers_guru",
               type: "POST",
               data: {
                   page: page,
                   css_class_offers_block: $ajax_div.data('css_class_offers_block') // уйдёт на render_offers_page
               },
               dataType: "script"
           }).done(callback);
       };

       fOffersProccessPaginateLinks = function () {
           //console.log("fOffersProccessPaginateLinks");
           fOffersGetWillPaginateLinks().click(function (e) {
               e.preventDefault();
               var page = $(this).attr('href').split("?page=")[1];
               //noinspection JSUnresolvedFunction
               History.pushState({page:page},window.document.title,"?page="+page);
           });
       };

       fOffersStartWillPaginateAjax = function () {
           if (fOffersGetWillPaginateLinks().length > 0) {
               fOffersProccessPaginateLinks();
               fOffersBindHistoryAdapter();
           }
       };

       var _fInit = function () {
           fOffersStartWillPaginateAjax();
       };

       _fInit();

   }
    
});