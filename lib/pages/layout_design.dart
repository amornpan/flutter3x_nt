import 'package:flutter/material.dart';

class LayoutDesign extends StatefulWidget {
  const LayoutDesign({super.key});

  @override
  State<LayoutDesign> createState() => _LayoutDesignState();
}

class _LayoutDesignState extends State<LayoutDesign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ออกแบบ Layout'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/building-2.png'),
              Padding(
                padding:  EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                      'R&D National Telecom',
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Divider(),
                    const Text(
                      'บริษัท โทรคมนาคมแห่งชาติ จำกัด (มหาชน) หรือ NT โดย นายวิรัตน์ บุญมี ผู้จัดการส่วนบริหารจัดการทรัพย์สินและการใช้พื้นที่ NT ผู้ประพันธ์เพลง“คุณธรรม คุณทำได้” ในกิจกรรมส่งเสริมค่านิยม วินัย พอเพียง สุจริต จิตอาสา ของ NT ประจำปี 2564 คว้า “รางวัลชนะเลิศ รางวัลคุณธรรม อวอร์ด ประเภทสื่อ สาขาบทเพลง ปี 2564” ',
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Expanded(
                          child: Icon(
                            Icons.pin_drop_outlined,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: const[
                                Text(
                                  'admin@nt.ntplc.co.th',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  'บริษัท โทรคมนาคมแห่งชาติ จำกัด (มหาชน) 99 ถนนแจ้งวัฒนะ แขวงทุ่งสองห้อง เขตหลักสี่ กรุงเทพ 10210',
                                ),
                              ],
                            )),
                        //Expanded(child: child),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
