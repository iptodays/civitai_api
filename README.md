# Civitai API Dart Client

该项目是一个用于与 Civitai API 进行交互的 Dart 客户端。Civitai 是一个提供丰富模型资源的平台，通过这个客户端，你可以方便地访问和获取 Civitai 上的模型信息。

## 安装

在你的 Dart 项目中添加以下依赖：

```yaml
dependencies:
  civitai_api: ^0.0.1
```

然后运行 `dart pub get` 来安装依赖。

## 使用示例

以下是一个简单的使用示例，展示如何通过该客户端获取特定模型版本的信息：

```dart
import 'package:civitai_api/civitai_api.dart';

void main() {
  // 初始化 CivitaApi 实例，传入你的 API 密钥
  final CivitaApi api = CivitaApi('your_api_key');

  // 通过模型版本 ID 获取模型版本信息
  api.getModelVersionById(128713).then((resp) {
    if (resp != null) {
      // 打印模型版本信息的 JSON 表示
      print(resp.toJson());
    } else {
      print('未获取到模型版本信息');
    }
  }).catchError((error) {
    // 处理错误
    print('获取模型版本信息时出错: $error');
  });
}
```

## API 文档

详细的 API 文档可以参考 [Civitai REST API 参考](https://github.com/civitai/civitai/wiki/REST-API-Reference)。

## 项目结构

- `lib/`：包含项目的源代码。
  - `creator.dart`：处理创作者相关信息的类。
  - `metadata.dart`：处理元数据相关信息的类。
  - `model.dart`：处理模型相关信息的类。
  - `model_version.dart`：处理模型版本相关信息的类。
- `pubspec.yaml`：项目的依赖配置文件。
- `analysis_options.yaml`：Dart 分析选项配置文件。

## 贡献

如果你发现了任何问题或者有新的功能建议，欢迎提交 issue 或者 pull request。

## 许可证

该项目使用 [MIT 许可证](https://opensource.org/licenses/MIT)。

## 版本历史

### 0.0.1

- 初始版本，提供基本的 API 客户端功能。
