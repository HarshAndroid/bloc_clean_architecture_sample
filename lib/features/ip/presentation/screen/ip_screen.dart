import 'package:cubit_demo/features/ip/data/model/ip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/ip_cubit.dart';
import '../../data/model/ip_card.dart';
import '../widget/ip_card.dart';

class IPScreen extends StatelessWidget {
  const IPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar
        appBar: AppBar(title: const Text('IP Test')),

        //refresh
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
              onPressed: context.read<IpCubit>().fetchIPDetails,
              child: const Icon(CupertinoIcons.refresh)),
        ),

        //body
        body: BlocBuilder<IpCubit, IpState>(
          builder: (context, state) {
            if (state is IpInitial) return _resultList(state.ipDetails);

            if (state is IpLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 1),
              );
            }

            if (state is IpResult) return _resultList(state.ipDetails);

            //
            return const SizedBox();
          },
        ));
  }

  Widget _resultList(IPDetailsModel model) => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          children: [
            //ip address
            IPCard(
              ipCardData: IPCardModel(
                  title: 'IP Address',
                  value: model.query,
                  icon: const Icon(CupertinoIcons.location_solid,
                      color: Colors.blue, size: 28)),
            ),

            //isp
            IPCard(
              ipCardData: IPCardModel(
                  title: 'Internet Provider',
                  value: model.isp,
                  icon: const Icon(Icons.business,
                      color: Colors.orange, size: 28)),
            ),

            //location
            IPCard(
              ipCardData: IPCardModel(
                  title: 'Location',
                  value: model.country,
                  icon: const Icon(CupertinoIcons.location,
                      color: Colors.pink, size: 28)),
            ),

            //pin code
            IPCard(
              ipCardData: IPCardModel(
                  title: 'Pin-code',
                  value: model.zip,
                  icon: const Icon(CupertinoIcons.location_solid,
                      color: Colors.cyan, size: 28)),
            ),

            //timezone
            IPCard(
                ipCardData: IPCardModel(
                    title: 'Timezone',
                    value: model.timezone,
                    icon: const Icon(CupertinoIcons.time,
                        color: Colors.green, size: 28)))
          ]);
}
