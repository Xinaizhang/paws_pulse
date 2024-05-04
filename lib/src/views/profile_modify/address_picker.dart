// profile_modify/address_picker.dart
import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';

class AddressPicker extends StatefulWidget {
  final String initialAddress;
  final ValueChanged<String> onAddressChanged;

  const AddressPicker({
    Key? key,
    required this.initialAddress,
    required this.onAddressChanged,
  }) : super(key: key);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  late String _selectedAddress;

  @override
  void initState() {
    super.initState();
    _selectedAddress = widget.initialAddress;
  }

  void _showCityPicker() async {
    Result? result = await CityPickers.showCityPicker(
      context: context,
      showType: ShowType.pca,
    );

    if (result != null) {
      setState(() {
        _selectedAddress =
            "${result.provinceName} ${result.cityName} ${result.areaName}";
      });
      widget.onAddressChanged(_selectedAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCityPicker,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '地址',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          Row(
            children: [
              Text(_selectedAddress),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
