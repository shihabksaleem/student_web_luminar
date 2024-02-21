import 'package:flutter/material.dart';
import 'package:lumainar/global_widgets/empty_screen_widget.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../../global_widgets/SearchBar.dart';
import 'widgets/batch_container.dart';

class BatchBottomTab extends StatefulWidget {
  const BatchBottomTab({super.key});

  @override
  State<BatchBottomTab> createState() => _BatchBottomTabState();
}

class _BatchBottomTabState extends State<BatchBottomTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<BatchScreenController>(context, listen: false).getBatchList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final batchscreenprovider = Provider.of<BatchScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary1),
        title: Center(
          child: Text(
            "Batches",
            style: TextStyle(color: ColorConstant.primary1, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: batchscreenprovider.isBatchsscreenLoading
          ? const Center(
              child: ReusableLoadingWidget(),
            )
          : SafeArea(
              child: batchscreenprovider.batchList.isEmpty
                  ? EmptyScreenWidget(text: "No Batches Found")
                  : RefreshIndicator(
                      color: ColorConstant.primary1,
                      onRefresh: () async {
                        await Provider.of<BatchScreenController>(context, listen: false).getBatchList();
                      },
                      child: Container(
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                // const SizedBox(height: 30),
                                // const SearchBarContainer(),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      batchscreenprovider.batchList.length <= 1
                                          ? "${batchscreenprovider.batchList.length}  Batch"
                                          : "${batchscreenprovider.batchList.length}  Batches",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      "Recently Added",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                const BatchContainer(),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
    );
  }
}
