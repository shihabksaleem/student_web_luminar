import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/mobile/batch_details_screen/view/batch_details.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:provider/provider.dart';

class BatchContainer extends StatefulWidget {
  const BatchContainer({super.key});

  @override
  State<BatchContainer> createState() => _BatchContainerState();
}

class _BatchContainerState extends State<BatchContainer> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await Provider.of<BatchScreenController>(context, listen: false)
  //         .getBatchList();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final batchscreenprovider = Provider.of<BatchScreenController>(context);
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 1000
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: batchscreenprovider.batchList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BatchDetails(
                        batchname:
                            batchscreenprovider.batchList[index].batchName ??
                                "",
                        batchId:
                            batchscreenprovider.batchList[index].id.toString(),
                      ),
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 8),
                              color: ColorConstant.lightGrey.withOpacity(.20),
                              blurRadius: 6,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffEDE9EE),
                        ),
                        height: 120,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.dvr,
                                    color: ColorConstant.primary1,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            batchscreenprovider.batchList[index]
                                                    .batchName ??
                                                '',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            batchscreenprovider.batchList[index]
                                                    .startdate ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox()
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Luminar Tecnolab",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    batchscreenprovider
                                                .batchList[index].course ==
                                            true
                                        ? "Online"
                                        : "Offline",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: batchscreenprovider
                                                    .batchList[index].course ==
                                                false
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                ],
                              ),
                              const SizedBox()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              })
          : GridView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: batchscreenprovider.batchList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BatchDetails(
                      batchname:
                          batchscreenprovider.batchList[index].batchName ?? "",
                      batchId:
                          batchscreenprovider.batchList[index].id.toString(),
                    ),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDE9EE),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 8),
                        color: ColorConstant.lightGrey.withOpacity(.20),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.dvr,
                            color: ColorConstant.primary1,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    batchscreenprovider
                                            .batchList[index].batchName ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    batchscreenprovider
                                            .batchList[index].startdate ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Luminar Tecnolab",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            batchscreenprovider.batchList[index].course == true
                                ? "Online"
                                : "Offline",
                            style: TextStyle(
                                fontSize: 15,
                                color: batchscreenprovider
                                            .batchList[index].course ==
                                        false
                                    ? Colors.red
                                    : Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
