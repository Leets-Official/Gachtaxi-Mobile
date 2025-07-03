# --- Flutter / R8 관련 설정 ---
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# --- BouncyCastle 관련 설정 (OkHttp가 조건부로 참조) ---
-keep class org.bouncycastle.** { *; }
-dontwarn org.bouncycastle.**

# --- Conscrypt 관련 설정 ---
-keep class org.conscrypt.** { *; }
-dontwarn org.conscrypt.**

# --- OpenJSSE 관련 설정 ---
-keep class org.openjsse.** { *; }
-dontwarn org.openjsse.**

# --- Dio와 관련된 OkHttp 내부 구현 보호 (선택) ---
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**
