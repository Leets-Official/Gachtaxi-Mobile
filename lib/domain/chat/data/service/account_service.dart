import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/account_response.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
AccountService accountService(Ref ref) {
  return AccountService(
    accountRepository: ref.watch(accountRepositoryProvider),
  );
}

class AccountService {
  final AccountRepository _accountRepository;


  const AccountService({
    required AccountRepository accountRepository,
  })  : _accountRepository = accountRepository;

  // 계좌 조회
  Future<AccountResponse> getAccount() {
    return _accountRepository.getAccount();
  }

  // 계좌 입력
  Future<AccountResponse> postAccount(String accountNumber) {
    return _accountRepository.postAccount(accountNumber);
  }
}
