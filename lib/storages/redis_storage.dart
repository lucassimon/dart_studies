import 'dart:async';

import 'package:redis/redis.dart';

import 'package:studies/storages/storages.dart';

class RedisStorage extends Object with AdapterInterface {

  static const uri = 'localhost';
  static const port = 6379;
  static final RedisStorage _instance = RedisStorage.internal();
  factory RedisStorage() => _instance;

  RedisStorage.internal();
  Command _conn;

  Future<Command> get conn async {
    if (_conn != null) {
      return _conn;
    } else {
      _conn = await connect();
      return _conn;
    }
  }

  Future<Command> connect() async {
    return await RedisConnection().connect(RedisStorage.uri, RedisStorage.port);
  }

  _send(String key, String value) async {
    Command cmd = await conn;
    return await cmd.set(key, value);
  }

  _fetchKey(String key) async {
    Command cmd = await conn;
    return await cmd.get(key);
  }

  sendMap(String key, String value, String index) async {
    Command cmd = await conn;
    return await cmd.send_object(["HSET", key, index, value]);
  }

  fetchMap(String key, String index) async {
    Command cmd = await conn;
    return await cmd.send_object(["HGET", key, index]);
  }

  _deleteKey(String key) async {
    Command cmd = await conn;
    return await cmd.send_object(["DEL", key]);
  }

  _purge() async {
    Command cmd = await conn;
    return await cmd.send_object("FLUSHALL");
  }

  dynamic save(String key, dynamic value) async {
    return await _send(key, value);
  }

  dynamic fetch(String key) async {
    return await _fetchKey(key);
  }

  delete(String key) async {
    return await _deleteKey(key);
  }

  clear() async {
    await _purge();
  }

}
