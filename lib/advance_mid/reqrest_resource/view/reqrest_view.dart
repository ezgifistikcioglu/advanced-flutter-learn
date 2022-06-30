import 'package:flutter/material.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full/mid/image_learn_mid.dart';
import 'package:flutter_full/product/extension/string_extension.dart';
import 'package:flutter_full/product/global/resource_context.dart';
import 'package:flutter_full/product/global/theme_notifier.dart';
import 'package:flutter_full/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqrestView extends StatefulWidget {
  const ReqrestView({Key? key}) : super(key: key);

  @override
  State<ReqrestView> createState() => _ReqrestViewState();
}

//class _ReqrestViewState extends ReqrestViewModel
class _ReqrestViewState extends State<ReqrestView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //change theme color
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: const [_SaveAndNavigateWidgetButton()],
              title: context.watch<ReqresProvider>().isLoading
                  ? CircularProgressIndicator(
                      color: Theme.of(context).canvasColor,
                    )
                  : null),
          body: Column(
            children: [
              const _IsLoadingStatusShowWidget(),
              Expanded(
                child: _resourceListView(
                    context, context.watch<ReqresProvider>().resources),
              ),
            ],
          ),
        );
      },
      create: (context) => ReqresProvider(ReqrestService(service)),
    );
  }
}

class _SaveAndNavigateWidgetButton extends StatelessWidget {
  const _SaveAndNavigateWidgetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<ReqresProvider>()
              .saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const ImageLearnMid();
          }));
        },
        icon: const Icon(Icons.ac_unit_outlined));
  }
}

class _IsLoadingStatusShowWidget extends StatelessWidget {
  const _IsLoadingStatusShowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider
          .isLoading; //isLoading durumunda çalışacak component oluşturmak için selector kullandık
    });
  }
}

ListView _resourceListView(BuildContext context, List<Data> items) {
  return ListView.builder(
      itemCount:
          items.length, //context.watch<ReqresProvider>().resources.length
      itemBuilder: (BuildContext context, int index) {
        //inspect(resources[index].colorValue);
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      });
}
