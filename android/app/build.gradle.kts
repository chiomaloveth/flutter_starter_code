android {
    namespace = "com.example.nova"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.nova"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "default"

    productFlavors {
        create("development") {
            dimension = "default"
            manifestPlaceholders = mapOf("appName" to "[DEV] Creating Flavors")
            applicationIdSuffix = ".dev"
        }
        create("production") {
            dimension = "default"
            manifestPlaceholders = mapOf("appName" to "Creating Flavors")
            applicationIdSuffix = ""
        }
    }
}

flutter {
    source = "../.."
}