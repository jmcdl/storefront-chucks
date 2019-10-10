"use strict";

// When the user scrolls the page, execute myFunction
window.onscroll = function () {
  fixedNavbar();
};

// Get the navbar
let navbar = document.querySelector(".navbar");
let homeContent = document.querySelector(".home-content");

// Get the offset position of the navbar
let sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function fixedNavbar() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("navbar--sticky");
        homeContent.classList.add("home-content--sticky-navbar");
    } else {
        navbar.classList.remove("navbar--sticky");
        homeContent.classList.remove("home-content--sticky-navbar");
    }
}