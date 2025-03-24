import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_data_provider.g.dart';

@riverpod
class ManualMatchingDataNotifier extends _$ManualMatchingDataNotifier {
  @override
  ManualMatchingResponse build() {
    return _getDummyMatchingResponse();
  }

  void fetchMatchingRooms() {
    state = _getDummyMatchingResponse();
  }

  ManualMatchingResponse _getDummyMatchingResponse() {
    return ManualMatchingResponse(
      code: 200,
      message: "수동 매칭방 조회에 성공했습니다.",
      data: MatchingData(
        rooms: [
          MatchingRoom(
            roomId: 1,
            chattingRoomId: 1,
            nickname: "이지훈",
            profilePicture:
                "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
            description:
                "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
            departure: "가천대학교 1번 출구",
            destination: "기숙사 정문",
            departureTime: "2024-02-14T15:30:00",
            departureDate: "2024-02-14",
            maxCapacity: 4,
            currentMembers: 1,
            tags: ["NO_SMOKE"],
          ),
          MatchingRoom(
            roomId: 2,
            chattingRoomId: 2,
            nickname: "김주영",
            profilePicture:
                "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
            description: "가천대학교 1번 출구에서 기숙사 정문까지 이동",
            departure: "가천대학교 1번 출구",
            destination: "기숙사 정문",
            departureTime: "2024-02-16T17:30:00",
            departureDate: "2024-02-16",
            maxCapacity: 4,
            currentMembers: 1,
            tags: ["ONLY_MALE"],
          ),
          MatchingRoom(
            roomId: 1,
            chattingRoomId: 1,
            nickname: "이지훈",
            profilePicture:
                "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
            description:
                "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
            departure: "가천대학교 1번 출구",
            destination: "기숙사 정문",
            departureTime: "2024-02-14T15:30:00",
            departureDate: "2024-02-14",
            maxCapacity: 4,
            currentMembers: 1,
            tags: ["NO_SMOKE"],
          ),
          MatchingRoom(
            roomId: 1,
            chattingRoomId: 1,
            nickname: "이지훈",
            profilePicture:
                "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
            description:
                "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
            departure: "가천대학교 1번 출구",
            destination: "기숙사 정문",
            departureTime: "2024-02-14T15:30:00",
            departureDate: "2024-02-14",
            maxCapacity: 4,
            currentMembers: 1,
            tags: ["NO_SMOKE"],
          ),
          // MatchingRoom(
          //   roomId: 1,
          //   chattingRoomId: 1,
          //   nickname: "이지훈",
          //   profilePicture:
          //       "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
          //   description:
          //       "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
          //   departure: "가천대학교 1번 출구",
          //   destination: "기숙사 정문",
          //   departureTime: DateTime.parse("2024-02-14T15:30:00"),
          //   departureDate: "2024-02-14",
          //   maxCapacity: 4,
          //   currentMembers: 1,
          //   tags: ["NO_SMOKE"],
          // ),
          // MatchingRoom(
          //   roomId: 1,
          //   chattingRoomId: 1,
          //   nickname: "이지훈",
          //   profilePicture:
          //       "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
          //   description:
          //       "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
          //   departure: "가천대학교 1번 출구",
          //   destination: "기숙사 정문",
          //   departureTime: DateTime.parse("2024-02-14T15:30:00"),
          //   departureDate: "2024-02-14",
          //   maxCapacity: 4,
          //   currentMembers: 1,
          //   tags: ["NO_SMOKE"],
          // ),
          // MatchingRoom(
          //   roomId: 1,
          //   chattingRoomId: 1,
          //   nickname: "이지훈",
          //   profilePicture:
          //       "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
          //   description:
          //       "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
          //   departure: "가천대학교 1번 출구",
          //   destination: "기숙사 정문",
          //   departureTime: DateTime.parse("2024-02-14T15:30:00"),
          //   departureDate: "2024-02-14",
          //   maxCapacity: 4,
          //   currentMembers: 1,
          //   tags: ["NO_SMOKE"],
          // ),
          // MatchingRoom(
          //   roomId: 1,
          //   chattingRoomId: 1,
          //   nickname: "이지훈",
          //   profilePicture:
          //       "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
          //   description:
          //       "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
          //   departure: "가천대학교 1번 출구",
          //   destination: "기숙사 정문",
          //   departureTime: DateTime.parse("2024-02-14T15:30:00"),
          //   departureDate: "2024-02-14",
          //   maxCapacity: 4,
          //   currentMembers: 1,
          //   tags: ["NO_SMOKE"],
          // ),
          // MatchingRoom(
          //   roomId: 1,
          //   chattingRoomId: 1,
          //   nickname: "이지훈",
          //   profilePicture:
          //       "https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4",
          //   description:
          //       "가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동가천대학교 1번 출구에서 기숙사 정문까지 이동",
          //   departure: "가천대학교 1번 출구",
          //   destination: "기숙사 정문",
          //   departureTime: DateTime.parse("2024-02-14T15:30:00"),
          //   departureDate: "2024-02-14",
          //   maxCapacity: 4,
          //   currentMembers: 1,
          //   tags: ["NO_SMOKE"],
          // ),
        ],
        pageable: Pageable(
          pageNumber: 0,
          pageSize: 5,
          numberOfElements: 2,
          isLast: true,
        ),
      ),
    );
  }
}
