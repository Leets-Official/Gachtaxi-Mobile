class MatchingRoom {
  final int roomId;
  final int chattingRoomId;
  final String nickname;
  final String? profilePicture;
  final String description;
  final String departure;
  final String destination;
  final DateTime departureTime;
  final String departureDate;
  final int maxCapacity;
  final int currentMembers;
  final List<String> tags;

  MatchingRoom({
    required this.roomId,
    required this.chattingRoomId,
    required this.nickname,
    required this.profilePicture,
    required this.description,
    required this.departure,
    required this.destination,
    required this.departureTime,
    required this.departureDate,
    required this.maxCapacity,
    required this.currentMembers,
    required this.tags,
  });

  factory MatchingRoom.fromJson(Map<String, dynamic> json) {
    return MatchingRoom(
      roomId: json['roomId'],
      chattingRoomId: json['chattingRoomId'],
      nickname: json['nickname'],
      profilePicture: json['profilePicture'],
      description: json['description'],
      departure: json['departure'],
      destination: json['destination'],
      departureTime: DateTime.parse(json['departureTime']),
      departureDate: json['departureDate'],
      maxCapacity: json['maxCapacity'],
      currentMembers: json['currentMembers'],
      tags: List<String>.from(json['tags']),
    );
  }
}

class Pageable {
  final int pageNumber;
  final int pageSize;
  final int numberOfElements;
  final bool isLast;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.numberOfElements,
    required this.isLast,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      numberOfElements: json['numberOfElements'],
      isLast: json['isLast'],
    );
  }
}

class MatchingData {
  final List<MatchingRoom> rooms;
  final Pageable pageable;

  MatchingData({required this.rooms, required this.pageable});

  factory MatchingData.fromJson(Map<String, dynamic> json) {
    return MatchingData(
      rooms: (json['rooms'] as List)
          .map((room) => MatchingRoom.fromJson(room))
          .toList(),
      pageable: Pageable.fromJson(json['pageable']),
    );
  }
}

class ManualMatchingResponse {
  final int code;
  final String message;
  final MatchingData data;

  ManualMatchingResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ManualMatchingResponse.fromJson(Map<String, dynamic> json) {
    return ManualMatchingResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: MatchingData.fromJson(json['data']),
    );
  }
}
