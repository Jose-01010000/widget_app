import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const String name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen'),
      ),
      body: const __UiControlsView(),
    );
  }
}

class __UiControlsView extends StatefulWidget {
  const __UiControlsView();

  @override
  State<__UiControlsView> createState() => __UiControlsViewState();
}

enum Transportation { car, bike, boat, bus }

class __UiControlsViewState extends State<__UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Enable developer mode'),
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = !isDeveloperMode;
            });
          },
        ),
        ExpansionTile(
          title: const Text("Vehicle transportation"),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Select car as your transportation'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Select boat as your transportation'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.boat),
            ),
            RadioListTile(
              title: const Text('Bus'),
              subtitle: const Text('Select bus as your transportation'),
              value: Transportation.bus,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.bus),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Select bike as your transportation'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.bike),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
