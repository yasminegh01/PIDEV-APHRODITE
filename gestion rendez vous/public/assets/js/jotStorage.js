(function (obj, createJotStorage) {
  'use strict'
  if (typeof exports != 'undefined') {
    module.exports = createJotStorage();
  } else {
    obj.JotStorage = createJotStorage();
  }

  return true;
})(this, function () {
  'use strict'
  var _jotStorage = false, storageService = false, jotStorageSize = 0, isStorageAvailable = false;

  function init() {

    isStorageAvailable = checkAvailability();
    if (isStorageAvailable) {
      storageService = window.localStorage;
      loadStorage();
      if ('addEventListener' in window) {
        window.addEventListener('pageshow', function (event) {
          if (event.persisted) {
            reloadData();
          }
        }, false);
      }
    }
  }

  function checkAvailability() {
    if (window.localStorage) {
      try {
        localStorage.setItem('JotStorageTest', 'yes');
        if (localStorage.getItem('JotStorageTest') === 'yes') {
          localStorage.removeItem('JotStorageTest');
          // localStorage is enabled
          return true;
        } else {
          throw new Error('localStorage is disabled');
        }
      } catch (Err) {
        throw new Error('localStorage is disabled');
      }
    } else {
      throw new Error('localStorage is not available');
    }
  }

  function reloadData() {
    try {
      loadStorage();
    } catch (Err) {
      isStorageAvailable = false;
      handleJotStorageError(Err);
    }
  }

  function loadStorage() {
    var source = storageService.getItem('jotStorage');
    try {
      _jotStorage = JSON.parse(source) || JSON.parse(storageService.getItem("jStorage")) || {};
      delete _jotStorage['__jstorage_meta'];
    } catch (Err) {
      _jotStorage = {};
    }
    save();
    setJotStorageSize();
  }

  function checkJotStorage() {
    if (!_jotStorage) {
      throw new Error('JotStorage is not available');
    }
    return true;
  }

  function save() {
    try {
      storageService.setItem('jotStorage', JSON.stringify(_jotStorage));
      setJotStorageSize();
    } catch (Err) {
      return handleJotStorageError(Err);
    }
    return true;
  }

  function setJotStorageSize() {
    var source = storageService.getItem('jotStorage');
    jotStorageSize = source ? String(source).length : 0;
  }

  function handleJotStorageError(Err) {
    console.error(Err);
  }

  function check(key) {
    if (typeof key != 'string' && typeof key != 'number') {
      throw new TypeError('Key name must be string or numeric');
    }
    return true;
  }

  try {
    init();
  } catch (err) {
    handleJotStorageError(err);
  }
  return {
    
    set: function (key, value) {
      check(key);
      checkJotStorage();
      if (typeof value === 'undefined') {
        this.remove(key);
        return;
      }

      try {
        value = JSON.parse(JSON.stringify(value));
      } catch (err) {
        handleJotStorageError(err);
        return;
      }

      _jotStorage[key] = value;
      save();
    },

    get: function (key) {
      check(key);
      checkJotStorage();
      if (_jotStorage.hasOwnProperty(key)) {
        return _jotStorage[key];
      }
      return null;
    },

    remove: function (key) {
      check(key);
      checkJotStorage();
      if (key in _jotStorage) {
        delete _jotStorage[key];
        save();
      }
    },

    flush: function () {
      checkJotStorage();
      _jotStorage = {};
      try {
        save();
      } catch (err) {
        handleJotStorageError(err);

      }
    },

    index: function () {
      checkJotStorage();
      var index = [], i;
      for (i in _jotStorage) {
        if (_jotStorage.hasOwnProperty(i)) {
          index.push(i);
        }
      }
      return index;
    }
  }
})
