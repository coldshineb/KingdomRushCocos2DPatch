# Kingdom Rush 王国保卫战 Cocos2D 引擎 Android 版修补指南
本指南适用于王国保卫战复仇，使用 Cocos2D 引擎开发的作品

对于使用 Love2D 的王国保卫战、前线、起源、联盟，请参考 https://github.com/coldshineb/KingdomRushLove2DPatch

本指南旨在对 Android 版进行修补，以实现与 PC 版相同的游戏体验，本仓库的示例代码基于复仇 1.16.06

本指南出于个人对数字内容的收藏需要制作，因移动端游戏向来有各种内购、广告满天飞、常年不更新游戏内容只更新氪金内容的毛病，本人已对许多经典游戏如割绳子、水果忍者、暗影格斗等制作了具有纪念收藏价值的完美版，一般情况下会对原安装包进行去签名验证、去授权验证、去广告、存档注入（如割绳子某款中的体力限制解除、无限付费道具等）、删除通知权限，避免不良体验，请务必在使用本指南时秉承相同的理念，即使联盟的 DLC、英雄等售价再逆天，也切勿跳脸正版玩家造成社区不良风气

## 授权验证修补

修改位于 `com/google/licensingservicehelper/LicensingServiceHelper$2` 下的 `public verifyLicense(ILandroid/os/Bundle;)V` 方法，伪造返回给底层授权的字符串，使得购买的正版游戏可以在任意设备上运行

```
.method public verifyLicense(ILandroid/os/Bundle;)V
    .registers 3

    iget-object v0, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;
    invoke-static {v0}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;
    move-result-object v0

    const-string v1, "bypassed"

    invoke-interface {v0, v1}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->allow(Ljava/lang/String;)V

    return-void
.end method
```

## 内购与内容解锁修补

### 修补流程

修改位于 `org/cocos2dx/cpp/InApp`

**1. 拦截内购请求、零秒发货**

直接调用 C++ 底层的 native 成功回调

* 拦截 `public static purchase(Ljava/lang/String;)V`

**2. 离线价格标签**

为了让游戏能够在没有 GMS 框架的设备上完美运行，需要删除内购价格获取相关代码

* 重写 `public static getProductPrice(Ljava/lang/String;)Ljava/lang/String;`, `public static getProductPriceValue(Ljava/lang/String;)F`

**3. Play Pass 订阅欺骗**

当设备上存在拥有 Play Pass 订阅的账号时，游戏会自动关闭所有弹出式广告、解锁全部 DLC、英雄、塔，并删除钻石内购，实现与 PC 版一致的游戏体验

* 强制 `public static isPlayPass()Z` 返回 `const/4 v0, 0x1`

若只想要内购破解，不需要进行此步骤，或者可选将 `public static isPlayPass()Z` 的返回值改为 `const/4 v0, 0x0`，这样即使设备上有 Play Pass 订阅也可继续使用内购破解

# 打包指南
* **合包：** 如果下载的是未经修改的纯原版游戏，可能拿到的是 apks 这种分包，使用 `java -jar APKEditor.jar m -i .\xxx.apks -o xxx.apk -extractNativeLibs true` 合包
* **解包：** 使用 `apktool d xxx.apk` 将基础包和所有 config 分包全部解开为明文
* **移除授权验证：** 将修改好的 `LicensingServiceHelper$2.smali` 复制到解包目录下的 `smali_classesX/com/google/licensingservicehelper/`
* **修补内购：** 将修改好的 `InApp.smali` 复制到解包目录下的 `org/cocos2dx/cpp/`
* **重编译与对齐签名：** 使用 `apktool b xxx -o xxx_patched.apk` 重新构建 APK，最后使用 `java -jar .\uber-apk-signer.jar -a xxx_patched.apk` 进行 V1/V2/V3 签名及 ZipAlign 对齐
