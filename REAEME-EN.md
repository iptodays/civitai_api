# Civitai API Dart Client

This project is a Dart client for interacting with the Civitai API. Civitai is a platform that provides a rich collection of model resources. With this client, you can easily access and obtain model information on Civitai.

## Installation

Add the following dependency to your Dart project:

```yaml
dependencies:
  civitai_api: ^0.0.1
```

Then run `dart pub get` to install the dependency.

## Usage Example

Here is a simple example showing how to obtain information about a specific model version using this client:

```dart
import 'package:civitai_api/civitai_api.dart';

void main() {
  // Initialize the CivitaApi instance with your API key
  final CivitaApi api = CivitaApi('your_api_key');

  // Get model version information by model version ID
  api.getModelVersionById(128713).then((resp) {
    if (resp != null) {
      // Print the JSON representation of the model version information
      print(resp.toJson());
    } else {
      print('Model version information not obtained');
    }
  }).catchError((error) {
    // Handle errors
    print('Error getting model version information: $error');
  });
}
```

## API Documentation

For detailed API documentation, please refer to [Civitai REST API Reference](https://github.com/civitai/civitai/wiki/REST-API-Reference).

## Project Structure

- `lib/`: Contains the source code of the project.
  - `creator.dart`: Class for handling creator-related information.
  - `metadata.dart`: Class for handling metadata-related information.
  - `model.dart`: Class for handling model-related information.
  - `model_version.dart`: Class for handling model version-related information.
- `pubspec.yaml`: Dependency configuration file of the project.
- `analysis_options.yaml`: Dart analysis option configuration file.

## Contribution

If you find any issues or have new feature suggestions, please submit an issue or a pull request.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
