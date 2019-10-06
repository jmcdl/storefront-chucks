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
<#--    <div class="product-add">-->
        <#--  add to cart -->
        <form class="product-add" method="post" action="${home}/product/addToCart">
          <#-- if product arrived at via vategory or seach, will send that data with form-->
            <#if categoryId??>
              <input type="hidden" value="${categoryId}" name="categoryId"/>
              <input type="hidden" value="${(categoryName)!''}" name="categoryName"/>
            <#elseif searchParameter??>
              <input type="hidden" value="${searchParameter}" name="searchParameter"/>
            </#if>
            <span class="product-add__product-name">${product.productName}</span>
              <#-- if the list price is bigger than the current price, show the saving -->
<#--            <#if (product.listPrice?? && product.listPrice > product.price)>-->
<#--              <div class="promo-info text-center">-->
<#--                  <span class="save-circle" v-if="product.listPrice">-->
<#--                      <span class="save-circle-title">SAVE</span>-->
<#--                      <span class="save-circle-text">$${(product.listPrice - product.price)?string(",##0.00")}</span>-->
<#--                  </span>-->
<#--              </div>-->
<#--            </#if>-->
              <span id="">$${product.price}</span>
                <#if (product.listPrice?? && product.listPrice > product.price)>
                  <span>
                        <span>was</span>
                        <del>$${product.listPrice}</del>
                    </span>
                </#if>
            <div class="">
              <input type="hidden" value="<#if selectedOptionId??>${selectedOptionId}<#else>${productId}</#if>" name="productId" id="productId" />
              <input type="hidden" value="${product.priceUomId}" name="currencyUomId" />
              <input type="hidden" value="${ec.web.sessionToken}" name="moquiSessionToken"/>
              <span class="">Quantity</span>
              <input class="" id="quantity" name="quantity" value="1" type="number" min="1" max="20" />
            </div>
              <#if isVirtual>
                <div class="form-group col">
                    <#assign featureTypes = variantsList.variantOptions.keySet()>
<#--                    <#list featureTypes![] as featureType>-->
                    <#list featureTypes?filter(featureType -> featureType.description != "Color")![] as featureType>
                        ${featureType.description!}
                        <#assign variants = variantsList.variantOptions.get(featureType)>
<#--                      <span>variants: ${variants}</span>-->

                      <select class="form-control" id="variantProduct${featureType?index}" required>
                        <option value="" disabled <#if !selectedOptionId?? >selected</#if>>
                          Select an Option
                        </option>
                          <#list variants![] as variant>
                              <#assign isSelected = selectedOptionId?? && selectedOptionId == variant.productId />
                            <option value="${variant.productId!}" <#if isSelected >selected</#if> >
                                ${variant.description}
                            </option>
                          </#list>
                      </select>
                    </#list>
                </div>
              </#if>
            <div class="form-group col">
                <#if isVirtual || inStock>
                  <button id="addToCart" class="btn btn-info btn-block" type="submit">
                    <i class="fa fa-shopping-cart"></i> Add to Cart
                  </button>
                </#if>
                <#if isVirtual || !inStock>
                  <h5 id="outOfStockText" class="text-center">Out of Stock</h5>
                </#if>
              <!-- feedback add product -->
                <#if addedCorrect??>
                    <#if addedCorrect == 'true'>
                      <input type="hidden" id="addedCorrect" value="${addedCorrect}"/>
                    <#else>
                      <small class="input-text form-text text-danger" role="alert">
                          ${product.productName} could not be add to your shopping cart.
                      </small>
                    </#if>
                </#if>
            </div>
        </form>
      </div>
<#--    </div>-->

</main>
<script>
  const prodImageUrl = "${home}/content/productImage/";
  console.log(prodImageUrl);
  let productImageLarge = document.querySelector(".product-image__main");
  console.log(productImageLarge);
  function changeLargeImage(productContentId) { productImageLarge.src = prodImageUrl + productContentId; }
  //Default image
  <#if productContentId?has_content>changeLargeImage("${productContentId}");</#if>

</script>