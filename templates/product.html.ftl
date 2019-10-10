<#--<#include "common.macro.ftl">-->
<#assign inStock = false>
<#if (product.productTypeEnumId == "PtVirtual")!false>
    <#assign isVirtual = true >
    <#if productAvailability.get(productId)!false><#assign inStock = true></#if>
<#else>
    <#assign isVirtual = false >
    <#if productAvailability.get(productId)!false><#assign inStock = true></#if>
</#if>
<main class="">
  <div class="product-breadcrumb">
    Shoes / Chucks / BLUE
  </div>
  <div class="product-content">
    <div class="product-image">
      <div class="product-image__thumbnails">
          <#assign hasThumbnail = false>
          <#list product.contentList as productContent>
              <#if (productContent.productContentTypeEnumId == "PcntImageSmall")>
                  <#assign hasThumbnail = true>
                  <#assign productContentId = productContent.productContentId>
                <img class="product-image__thumbnail" src="${home}/content/productImage/${productContentId}" alt="Product Image Thumbnail"onclick="changeLargeImage(productContentId)">
              </#if>
          </#list>
          <#if !hasThumbnail>
            <img class="product-image__thumbnail"
                 src="/store/assets/default.png"
                 alt="Product Image Thumbnail">
          </#if>
      </div>
        <#assign hasImage = false>
        <#list product.contentList as productContent>
            <#if (productContent.productContentTypeEnumId == "PcntImageLarge" || productContent.productContentTypeEnumId == "PcntImageMedium")>
                <#assign hasImage = true>
                <#assign productContentId = productContent.productContentId>
<#--              <img itemprop="image" id="product-image-large" class="img-fluid pointer"-->
<#--                   data-toggle="modal" data-target="#imgModal">-->
              <img class="product-image__main" src="${home}/content/productImage/${productContentId}" alt="Product Image">
                <#break>
            </#if>
        </#list>
        <#if !hasImage>
          <img class="img-fluid"
               src="/store/assets/default.png"
               alt="Product Image">
        </#if>
    </div>
        <#--  add to cart -->
        <form class="product-add" method="post" action="${home}/product/addToCart">
          <#-- if product arrived at via vategory or seach, will send that data with form-->
            <#if categoryId??>
              <input type="hidden" value="${categoryId}" name="categoryId"/>
              <input type="hidden" value="${(categoryName)!''}" name="categoryName"/>
            <#elseif searchParameter??>
              <input type="hidden" value="${searchParameter}" name="searchParameter"/>
            </#if>
            <div class="product-add__product-name">${product.productName}</div>
            <div class="product-add__product-price">
                <#if (product.listPrice?? && product.listPrice > product.price)>
                  <del class="product-add__old-price">$${product.listPrice}</del><span id=""> $${product.price}</span>
                <#else>
                  <span id="">$${product.price}</span>
                </#if>
            </div>
          <div class="product-add__features">
            <input type="hidden" value="${product.pseudoId}" name="productId" id="productId" />
            <input type="hidden" value="${product.priceUomId}" name="currencyUomId" />
            <input type="hidden" value="${ec.web.sessionToken}" name="moquiSessionToken"/>
            <#assign featureTypes = variantsList.listFeatures.keySet()>
            <#assign arrayIds = [] />
            <#list featureTypes![] as featureType>
                
                <#assign variants = variantsList.listFeatures.get(featureType)>
                <#if variants?size gt 1 >
                ${featureType.description!}
                <select class="form-control featureSelect" name="${featureType.productFeatureTypeEnumId}" id="variantProduct${featureType?index}" required>
                    <option value="" disabled selected>
                        Select an Option 
                    </option>
                    <#list variants![] as variant>
                        <option value="${variant.productFeatureId}">
                            ${variant.description!} 
                        </option>
                    </#list>
                </select>
                </#if>
            </#list>
          </div>
          <div id="addToCartSection">
            <div class="product-add__quantity">
              <label class="">Quantity <input class="product-add__quantity-input" name="quantity" value="1" type="number" min="1" max="20"/></label>
            </div>
            <button class="product-add__button" type="submit">
              <i class="fa fa-shopping-cart"></i>ADD TO CART
            </button>
          </div>
          <button class="product-add__button-disabled" id="outOfStock" type="submit" disabled>Out of Stock
          </button>
        </form>
      </div>

</main>
<script type="text/javascript" src="/store/assets/pdp.js"></script>
<script>
  var variants = ${Static["groovy.json.JsonOutput"].toJson((variantsList.variants)![])}
  var selectedProductId = '${selectedOptionId!''}';

  const prodImageUrl = "${home}/content/productImage/";
  let productImageLarge = document.querySelector(".product-image__main");
  function changeLargeImage(productContentId) { productImageLarge.src = prodImageUrl + productContentId; }
  //Default image
  <#if productContentId?has_content>changeLargeImage("${productContentId}");</#if>


    document.body.onload = function() {
        initializeFeatureSelects();
    }
</script>