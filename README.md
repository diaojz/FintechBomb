

## 项目运行设置

```shell
$ cd (projectRootDir)
$ bash ./scripts/setup.sh 
$ open FintechBomb.xcworkspace 
```

## 需要在本地先创建一个 local.keys 文件，存储以下键值对
```
CI_BUILD_NUMBER=10 # Change it every time when running the build locally
APP_STORE_CONNECT_API_CONTENT=<App Store Connect API for an App Manager>
FIREBASE_API_TOKEN=<Firebase API token for App Distribution>
GITHUB_API_TOKEN=<GitHub API token for accessing the private repo for certificates and provisioning profiles>
MATCH_PASSWORD=<Password for certificates for App signing on GitHub private repo>
```

## 运行一下脚本 source ./scripts/export_env.sh 把keys中的变量写入到 export里
