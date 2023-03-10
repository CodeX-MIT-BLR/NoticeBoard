import 'package:flutter/material.dart';
import 'package:notice_board/infoScreen.dart';
import 'package:notice_board/main.dart';

import 'package:notice_board/notice.dart';
import 'package:intl/intl.dart';

class NoticeList extends StatefulWidget {
  final List<Notice> noticeArray;
  NoticeList(this.noticeArray);

  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: widget.noticeArray.map((nt) {
      return Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          nt.unread ? nt.unread = false : nt.unread = true;
                        });
                      },
                      icon: Icon(
                        nt.unread
                            ? Icons.mark_email_unread
                            : Icons.mark_email_read,
                        color: nt.unread ? Colors.orange : Colors.grey,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nt.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: -0.6,
                              color: Colors.white),
                        ),
                        Text(
                          DateFormat.yMMMd().format(nt.date),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: -0.6,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: nt.displayImage,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                nt.description,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoScreen(nt)));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange)),
                    child: const Text("Read More"),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }).toList()));
  }
}
