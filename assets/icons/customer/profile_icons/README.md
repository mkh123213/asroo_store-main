# Profile Screen Icons

Modern outlined SVG icons for the redesigned Arabic customer profile screen.

## Included
- Profile avatar/user
- Camera edit avatar
- My Orders
- Addresses
- Payment Methods
- Favorites
- Language
- Dark Mode
- Notifications
- Developer
- App Version
- Logout
- Bottom navigation icons

## Flutter setup

```yaml
dependencies:
  flutter_svg: ^2.0.10

flutter:
  assets:
    - assets/icons/profile/
```

## Usage

```dart
SvgPicture.asset(
  'assets/icons/profile/orders_bag.svg',
  width: 24,
  height: 24,
  colorFilter: const ColorFilter.mode(
    Color(0xffD41445),
    BlendMode.srcIn,
  ),
);
```

Suggested colors:
- Light mode active/accent: `0xffD41445`
- Dark mode active/accent: `0xff3D7BFF`
- Inactive gray: `0xff9E9E9E`
