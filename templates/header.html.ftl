<#assign cartCount = 0>
<#if cartInfo.orderItemList??>
    <#list cartInfo.orderItemList as item>
        <#if item.itemTypeEnumId == "ItemProduct">
            <#assign cartCount = cartCount + (item.quantity!1)>
        </#if>
    </#list>
</#if>
<header class="header">
  <div class="top-bar">
    <a class="top-bar__text" href="#">Up & Receive $50 Off Purchases Of $150 Or More</a>
  </div>
  <nav class="navbar">
    <h1 class="navbar__logo">
      <a href="/store" aria-label="Chucks Store" title="Chucks Store">CHUCKS</a>
    </h1>
    <ul class="navbar__menu">
      <li class="navbar__menu-item"><a class="" href="" title="">Women</a></li>
      <li class="navbar__menu-item"><a class="" href="" title="">Men</a></li>
      <li class="navbar__menu-item"><a class="" href="" title="">Accessories</a></li>
      <li class="navbar__menu-item"><a class="" href="" title="">Best Sellers</a></li>
      <li class="navbar__menu-item"><a class="" href="" title="">Sales</a></li>
      <li class="navbar__menu-item"><a class="" href="" title="">Rewards</a></li>
    </ul>
    <ul class="navbar__user">
      <li class="navbar__user-menu-item">
        <img src="https://bfx-objects.borderfree.com/v1/dist/images/context-chooser/flags/US.gif"
             alt="United States">
      </li>
        <#if partyDetail??>
          <li  class="navbar__user-menu-item"><a href="/store/logOut">Signout</a></li>
        <#else>
          <li  class="navbar__user-menu-item"><a href="/store/d#/login">Sign In</a></li>
        </#if>
      <li class=" navbar__user-menu-item">
        <svg class="user-menu__icon" viewBox="0 0 12 16" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <polygon id="search-polygon-0" points="0 0 12 0 12 16 0 16"></polygon>
          </defs>
          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g transform="translate(-1162.000000, -81.000000)">
              <g>
                <g transform="translate(0.000000, 45.000000)">
                  <g transform="translate(1162.000000, 36.000000)">
                    <mask id="mask-2-0" fill="white">
                      <use xlink:href="#search-polygon-0"></use>
                    </mask>
                    <path class="icon-search-path" id="Fill-1-0" fill="#000000"
                          mask="url(#mask-2-0)"
                          d="M3.84949909,9.86809102 C1.70194761,8.58283132 0.987349834,5.76759651 2.25649318,3.59269663 C3.52563652,1.41779676 6.30532793,0.694061551 8.45276888,1.9794332 C10.6002098,3.26480484 11.3146971,6.07992771 10.0455537,8.25493953 C8.77641038,10.4298394 5.99694003,11.1534627 3.84949909,9.86809102 M9.12757467,0.822912166 C6.35053605,-0.839271965 2.75588262,0.096602182 1.11468419,2.90926222 C-0.412554403,5.52623949 0.28236845,8.8591157 2.6233532,10.6492549 L0.0923617085,14.9865166 C-0.0939974343,15.3057885 0.0105670669,15.7177522 0.325808037,15.9063824 C0.64115954,16.0952364 1.04781155,15.9893348 1.23428122,15.669951 L3.76516218,11.3325773 C6.44249976,12.5463031 9.66034517,11.5552393 11.1874732,8.93837394 C12.8286717,6.1257139 11.9046133,2.48520824 9.12757467,0.822912166"></path>
                  </g>
                </g>
              </g>
            </g>
          </g>
        </svg>
      </li>
      <li class="navbar__user-menu-item">
        <svg class="user-menu__icon" version="1.1" xmlns="http://www.w3.org/2000/svg" width="64px" height="60.833px"
             viewBox="0 0 64 60.833">
          <path stroke="#000" stroke-width="5" stroke-miterlimit="10" fill-opacity="0"
                d="M45.684,2.654c-6.057,0-11.27,4.927-13.684,10.073 c-2.417-5.145-7.63-10.073-13.687-10.073c-8.349,0-15.125,6.776-15.125,15.127c0,16.983,17.134,21.438,28.812,38.231 c11.038-16.688,28.811-21.787,28.811-38.231C60.811,9.431,54.033,2.654,45.684,2.654z"></path>
        </svg>
      </li>
      <#if cartCount gt 0>
        <li class="navbar__user-menu-item"><a href="${home}/d#/checkout" >Cart (${cartCount})</a></li>
      <#else>
        <li class="navbar__user-menu-item"><a href="#" >Cart</a></li>
      </#if>
    </ul>
  </nav>

</header>