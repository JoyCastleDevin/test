CONFIG_BRANCH="$1"
#CONFIG_REPO_URL="git@codeup.teambition.com:joycastle/mm/Server_V2_Config.git"
CONFIG_REPO_URL="git@codeup.aliyun.com:62b023a03e81781f3ad195c6/Server_V2_Config.git"
# CONFIG_REPO_URL="https://codeup.aliyun.com/62b023a03e81781f3ad195c6/Server_V2_Config.git"

DIR="$(pwd)"

echo "当前地址""$DIR"

echo "从""$CONFIG_REPO_URL""的""$CONFIG_BRANCH""分支拉取文件"

if [ -d "./Server_V2_Config" ];then
    rm -rf ./Server_V2_Config
fi

git clone \
  --branch "$CONFIG_BRANCH" \
  --depth 1  \
  "$CONFIG_REPO_URL"

cd Server_V2_Config || exit

RELEASE_VERSION=$(sed -n 1p RELEASE_VERSION)

if [ "$2" != "" ];then
    RELEASE_VERSION=$2
fi

echo "========================================================================================================="
echo "当前发行版本号：""$RELEASE_VERSION"
echo "满级玩法配置如下："

tail -n +3 "$RELEASE_VERSION"/maxleveltournament.csv

echo "========================================================================================================="
echo "公会活动配置如下："

tail -n 2 "$RELEASE_VERSION"/teamchesttime.csv

echo "========================================================================================================="

mkdir -p "$DIR"/csvtemplate
rm "$DIR"/csvtemplate/*
#cd "$RELEASE_VERSION" && cp ./* "$DIR"/confmanager/template
cd "$RELEASE_VERSION" && cp ./* "$DIR"/csvtemplate/

if [ "$1" != "dev" ];then
	exit 0
fi

cd $DIR
echo "部署faketime h5调试文件"
if [ -d "./faketime_h5" ];then
    rm -rf ./faketime_h5
fi
if [ -d "./casual-server-lib" ];then
    rm -rf ./casual-server-lib
fi
git clone git@github.com:joycastle/casual-server-lib.git 
ls casual-server-lib/faketime/h5
cp -r casual-server-lib/faketime/h5 ./faketime_h5
rm -rf casual-server-lib
