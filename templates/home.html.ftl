<main class="home-content">
  <section>
    <img class="hero-image" src="static/images/woman-3377839_1280.jpg" alt="banner-image"/>
  </section>
  <section class="twin-promos">
    <div class="product-card">
      <img class="product-card__img" src="static/images/girl-983969_640-orig.jpg" alt="">
      <div class="product-card__heading-row">
        <h2 class="product-card__heading">HIGH IMPACT</h2>
        <h3 class="product-card__link"><a href="#">SHOP NOW</a></h3>
      </div>
      <div class="product-card__caption">Textured Statements</div>
    </div>
    <div class="product-card">
      <img class="product-card__img" src="static/images/scooter-1605608_640.jpg" alt="">
      <div class="product-card__heading-row">
        <h2 class="product-card__heading">ESSENTIAL SNAKE</h2>
        <h3 class="product-card__link"><a href="#">SHOP NOW</a></h3>
      </div>
      <div class="product-card__caption">Printed Matters</div>
    </div>
  </section>
    <#if featureProductList?has_content>
  <section class="featured-products">
    <div class="featured-products__heading-row">
      <h2 class="featured-products__heading-text">FEATURED PRODUCTS</h2>
    </div>
    <div class="featured-products__cards">
        <#list featureProductList as product>
          <div class="featured-products__card">
              <#if product.mediumImageInfo??>
                <a href="/store/product/${product.productId}"><img class="featured-products__img"
                                                                   src="/store/content/productImage/${product.mediumImageInfo.productContentId}"
                                                                   alt=""></a>
              </#if>
            <span class="product-name">${product.productName}</span>
            <span class="product-price">${product.listPrice}</span>
          </div>
        </#list>
    </div>
  </section>
  <section class="email-subscription">
      </#if>

  </section>
</main>