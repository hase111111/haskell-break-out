
# まずは stack build して，コンパイㇽが成功しているか確認する
if stack build; then
    printf "\033[0;34m"         # 青色
    echo "Build succeeded."
    printf "\033[0m"            # もとの色に戻す
else
    printf "\033[0;31m"         # 赤色
    echo "Build failed."    
    printf "\033[0m"            # もとの色に戻す
    exit 1
fi

# 次に stack exec で実行する
if stack exec haskell-break-out-exe; then
    printf "\033[0;34m"         # 青色
    echo "Execution succeeded."
    printf "\033[0m"            # もとの色に戻す
else
    printf "\033[0;31m"         # 赤色
    echo "Execution failed."    
    printf "\033[0m"            # もとの色に戻す
    exit 1
fi
