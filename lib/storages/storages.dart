abstract class AdapterInterface {
  void save(String key, dynamic value);
  void fetch(String key);
  void clear();
}

class Storage {
    AdapterInterface _source;

    Storage (AdapterInterface source) {
      this._source = source;
    }

    get storage => this._source;

    void save(String key, dynamic value) async => await this.storage.save(key, value);

    fetch(String key) async => await this.storage.fetch(key);

    void clear() async => await this.storage.clear();
}
