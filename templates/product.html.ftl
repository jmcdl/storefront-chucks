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
        <img class="product-image__thumbnail" src="/store/content/productImage/${product.smallImageInfo.productContentId}" alt="">
      </div>
      <img class="product-image__main" src="/store/content/productImage/${product.mediumImageInfo.productContentId}" alt="">
    </div>
    <div class="product-content__add">
      add to cart
    </div>

  </div>

</main>