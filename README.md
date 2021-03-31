# calaulater

simple flutter calculator with to themes and without using math package

## Screenshot
### Black theme
the defult one
[!black theme](./Screenshot_1617188324.png)

### Orange theme
you can change to it by change home widget to OCalApp like this
```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: OCalApp(),//OCalApp() to use orange one
    );
  }
}
```
[!orange theme](./Screenshot_1617188399.png)

## Resources to learn

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
