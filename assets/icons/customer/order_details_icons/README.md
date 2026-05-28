# Order Details / Tracking Screen Icons

Modern outlined SVG icons for the Arabic customer Order Details / Tracking screen.

## Included
- order_bag
- calendar
- truck
- wallet / cash / credit_card
- status_check_filled
- package_box
- delivered_box
- location_pin
- phone
- products_bag
- receipt
- support_headset
- bottom navigation icons

## Flutter setup

```yaml
dependencies:
  flutter_svg: ^2.0.10

flutter:
  assets:
    - assets/icons/order_details/
```

## Usage

```dart
SvgPicture.asset(
  'assets/icons/order_details/truck.svg',
  width: 24,
  height: 24,
  colorFilter: const ColorFilter.mode(
    Color(0xffD41445),
    BlendMode.srcIn,
  ),
);
```

Suggested colors:
- Light mode accent: `0xffD41445`
- Dark mode accent: `0xff3D7BFF`
- Success green: `0xff22C55E`
- Warning orange: `0xffF59E0B`
- Error red: `0xffEF4444`
- Inactive gray: `0xff9E9E9E`
