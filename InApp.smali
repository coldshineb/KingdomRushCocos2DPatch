.class public Lorg/cocos2dx/cpp/InApp;
.super Ljava/lang/Object;
.source "InApp.java"

# interfaces
.implements Lcom/android/billingclient/api/PurchasesUpdatedListener;


# static fields
.field private static BASE_64_ENCODED_PUBLIC_KEY:Ljava/lang/String; = ""

.field private static final TAG:Ljava/lang/String; = "Ironhide InApp"

.field private static mActivity:Landroid/app/Activity;

.field private static mBillingClient:Lcom/android/billingclient/api/BillingClient;

.field private static playPass:Z

.field private static productIDs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/QueryProductDetailsParams$Product;",
            ">;"
        }
    .end annotation
.end field

.field private static productList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/ProductDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 44
    sput-boolean p0, Lorg/cocos2dx/cpp/InApp;->playPass:Z

    return p0
.end method

.method static synthetic access$100()Lcom/android/billingclient/api/BillingClient;
    .locals 1

    .line 44
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/List;
    .locals 1

    .line 44
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->productList:Ljava/util/List;

    return-object v0
.end method

.method public static addProductID(Ljava/lang/String;)V
    .locals 3

    .line 109
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->productIDs:Ljava/util/List;

    invoke-static {}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product;->newBuilder()Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v1

    .line 110
    invoke-virtual {v1, p0}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductId(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v1

    const-string v2, "inapp"

    .line 111
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductType(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v1

    .line 112
    invoke-virtual {v1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->build()Lcom/android/billingclient/api/QueryProductDetailsParams$Product;

    move-result-object v1

    .line 109
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "addProductID: added product "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Ironhide InApp"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static consumePurchase(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 158
    invoke-static {}, Lcom/android/billingclient/api/ConsumeParams;->newBuilder()Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/ConsumeParams$Builder;->setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/billingclient/api/ConsumeParams$Builder;->build()Lcom/android/billingclient/api/ConsumeParams;

    move-result-object p0

    .line 159
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    new-instance v1, Lorg/cocos2dx/cpp/InApp$3;

    invoke-direct {v1, p1, p2}, Lorg/cocos2dx/cpp/InApp$3;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {v0, p0, v1}, Lcom/android/billingclient/api/BillingClient;->consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V

    return-void
.end method

.method private static generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 360
    :try_start_0
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 361
    const-string v0, "RSA"

    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    .line 362
    new-instance v1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v1, p0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 367
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "generatePublicKey: Invalid key specification: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Ironhide InApp"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :catch_1
    move-exception p0

    .line 365
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static getProductDescription(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 287
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->productList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/ProductDetails;

    .line 289
    invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 291
    invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getDescription()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 295
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static getProductPrice(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "Free"

    return-object v0
.end method

.method public static getProductPriceValue(Ljava/lang/String;)F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static getProductTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 274
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->productList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/ProductDetails;

    .line 276
    invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 278
    invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 282
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static isPlayPass()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static native onPurchaseFailed()V
.end method

.method public static native onPurchaseSuccessful(Ljava/lang/String;)Z
.end method

.method public static purchase(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lorg/cocos2dx/cpp/InApp;->onPurchaseSuccessful(Ljava/lang/String;)Z

    return-void
.end method

.method public static purchaseProduct(Lcom/android/billingclient/api/ProductDetails;)V
    .locals 2

    .line 250
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 251
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;

    move-result-object v1

    .line 252
    invoke-virtual {v1, p0}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;->setProductDetails(Lcom/android/billingclient/api/ProductDetails;)Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;

    move-result-object p0

    .line 253
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams;

    move-result-object p0

    .line 251
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->setProductDetailsParamsList(Ljava/util/List;)Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams;

    move-result-object p0

    .line 255
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    sget-object v1, Lorg/cocos2dx/cpp/InApp;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/BillingClient;->launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;

    return-void
.end method

.method public static queryPurchaseHistoryAsync()V
    .locals 3

    .line 186
    sget-boolean v0, Lorg/cocos2dx/cpp/InApp;->playPass:Z

    if-eqz v0, :cond_0

    return-void

    .line 188
    :cond_0
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    .line 189
    invoke-static {}, Lcom/android/billingclient/api/QueryPurchasesParams;->newBuilder()Lcom/android/billingclient/api/QueryPurchasesParams$Builder;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/QueryPurchasesParams$Builder;->setProductType(Ljava/lang/String;)Lcom/android/billingclient/api/QueryPurchasesParams$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/billingclient/api/QueryPurchasesParams$Builder;->build()Lcom/android/billingclient/api/QueryPurchasesParams;

    move-result-object v1

    new-instance v2, Lorg/cocos2dx/cpp/InApp$4;

    invoke-direct {v2}, Lorg/cocos2dx/cpp/InApp$4;-><init>()V

    .line 188
    invoke-virtual {v0, v1, v2}, Lcom/android/billingclient/api/BillingClient;->queryPurchasesAsync(Lcom/android/billingclient/api/QueryPurchasesParams;Lcom/android/billingclient/api/PurchasesResponseListener;)V

    return-void
.end method

.method public static refreshProducts()V
    .locals 3

    .line 123
    invoke-static {}, Lcom/android/billingclient/api/QueryProductDetailsParams;->newBuilder()Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;

    move-result-object v0

    sget-object v1, Lorg/cocos2dx/cpp/InApp;->productIDs:Ljava/util/List;

    .line 124
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;->setProductList(Ljava/util/List;)Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;->build()Lcom/android/billingclient/api/QueryProductDetailsParams;

    move-result-object v0

    .line 127
    sget-object v1, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    new-instance v2, Lorg/cocos2dx/cpp/InApp$2;

    invoke-direct {v2}, Lorg/cocos2dx/cpp/InApp$2;-><init>()V

    invoke-virtual {v1, v0, v2}, Lcom/android/billingclient/api/BillingClient;->queryProductDetailsAsync(Lcom/android/billingclient/api/QueryProductDetailsParams;Lcom/android/billingclient/api/ProductDetailsResponseListener;)V

    return-void
.end method

.method public static setPublicKey(Ljava/lang/String;)V
    .locals 0

    .line 118
    sput-object p0, Lorg/cocos2dx/cpp/InApp;->BASE_64_ENCODED_PUBLIC_KEY:Ljava/lang/String;

    return-void
.end method

.method private static verify(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 384
    const-string v0, "Ironhide InApp"

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p2, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    .line 390
    :try_start_1
    const-string v2, "SHA1withRSA"

    invoke-static {v2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v2

    .line 391
    invoke-virtual {v2, p0}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 392
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/security/Signature;->update([B)V

    .line 393
    invoke-virtual {v2, p2}, Ljava/security/Signature;->verify([B)Z

    move-result p0

    if-nez p0, :cond_0

    .line 394
    const-string p0, "verify: Signature verification failed."

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_0

    return v1

    :cond_0
    const/4 p0, 0x1

    return p0

    .line 404
    :catch_0
    const-string p0, "verify: Signature exception."

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 402
    :catch_1
    const-string p0, "verify: Invalid key specification."

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :catch_2
    move-exception p0

    .line 400
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 386
    :catch_3
    const-string p0, "verify: Base64 decoding failed."

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method private static verifyValidSignature(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 333
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->BASE_64_ENCODED_PUBLIC_KEY:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "verifyValidSignature: Failed to verify purchase."

    const-string v3, "Ironhide InApp"

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 341
    :cond_0
    :try_start_0
    sget-object v0, Lorg/cocos2dx/cpp/InApp;->BASE_64_ENCODED_PUBLIC_KEY:Ljava/lang/String;

    invoke-static {v0}, Lorg/cocos2dx/cpp/InApp;->generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;

    move-result-object v0

    .line 342
    invoke-static {v0, p0, p1}, Lorg/cocos2dx/cpp/InApp;->verify(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 346
    :catch_0
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 335
    :cond_1
    :goto_0
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method


# virtual methods
.method public init(Landroid/app/Activity;)V
    .locals 1

    .line 59
    sput-object p1, Lorg/cocos2dx/cpp/InApp;->mActivity:Landroid/app/Activity;

    .line 60
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClient;->newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    .line 61
    invoke-virtual {p1, p0}, Lcom/android/billingclient/api/BillingClient$Builder;->setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    .line 62
    invoke-static {}, Lcom/android/billingclient/api/PendingPurchasesParams;->newBuilder()Lcom/android/billingclient/api/PendingPurchasesParams$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/billingclient/api/PendingPurchasesParams$Builder;->enableOneTimeProducts()Lcom/android/billingclient/api/PendingPurchasesParams$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/billingclient/api/PendingPurchasesParams$Builder;->build()Lcom/android/billingclient/api/PendingPurchasesParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/billingclient/api/BillingClient$Builder;->enablePendingPurchases(Lcom/android/billingclient/api/PendingPurchasesParams;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient$Builder;->build()Lcom/android/billingclient/api/BillingClient;

    move-result-object p1

    sput-object p1, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    .line 66
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    sput-object p1, Lorg/cocos2dx/cpp/InApp;->productList:Ljava/util/List;

    .line 67
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    sput-object p1, Lorg/cocos2dx/cpp/InApp;->productIDs:Ljava/util/List;

    .line 69
    sget-object p1, Lorg/cocos2dx/cpp/InApp;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    new-instance v0, Lorg/cocos2dx/cpp/InApp$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/cpp/InApp$1;-><init>(Lorg/cocos2dx/cpp/InApp;)V

    invoke-virtual {p1, v0}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V

    return-void
.end method

.method public onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    .line 210
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    const/4 v0, 0x1

    .line 211
    const-string v1, "Ironhide InApp"

    if-nez p1, :cond_3

    if-eqz p2, :cond_3

    .line 213
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/billingclient/api/Purchase;

    .line 215
    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 217
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onPurchasesUpdated: purchase is pending, so skipping "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 219
    :cond_0
    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 220
    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/cocos2dx/cpp/InApp;->verifyValidSignature(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 222
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onPurchasesUpdated: purchase verified "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/android/billingclient/api/Purchase;->getProducts()Ljava/util/List;

    move-result-object p2

    const/4 v3, 0x0

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {v2, p2, v3}, Lorg/cocos2dx/cpp/InApp;->consumePurchase(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 227
    :cond_1
    const-string p2, "onPurchasesUpdated: purchase failed"

    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-static {}, Lorg/cocos2dx/cpp/InApp;->onPurchaseFailed()V

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    if-ne p1, v0, :cond_4

    .line 235
    const-string p1, "onPurchasesUpdated: purchase cancelled"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    invoke-static {}, Lorg/cocos2dx/cpp/InApp;->onPurchaseFailed()V

    return-void

    .line 241
    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "onPurchasesUpdated: purchase failed with responseCode:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-static {}, Lorg/cocos2dx/cpp/InApp;->onPurchaseFailed()V

    return-void
.end method
