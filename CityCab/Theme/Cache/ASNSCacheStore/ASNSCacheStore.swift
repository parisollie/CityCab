//
//  ASNSCacheStore.swift
//  ASSocialHome1
//
//  Created by Paul F on 22/2/25.
//

import Foundation

// Global dictionary to hold NSCacheStore instances based on type names
private var cacheManagerInstances: [String: Any] = [:]
private let cacheManagerQueue = DispatchQueue(label: "com.alisonstudio.cacheManagerQueue")

class ASNSCacheStore<Key: Hashable, Value> {
    
    private var cache: ASDefaultNSCacheStoreDatasource<Key, Value>
    
    static var shared: ASNSCacheStore<Key, Value> {
        let typeName = "\(Key.self)-\(Value.self)"
        return cacheManagerQueue.sync {
            if let cachedInstance = cacheManagerInstances[typeName] as? ASNSCacheStore<Key, Value> {
                return cachedInstance
            } else {
                let newInstance = ASNSCacheStore<Key, Value>()
                cacheManagerInstances[typeName] = newInstance
                return newInstance
            }
        }
    }

    init() {
        self.cache = ASDefaultNSCacheStoreDatasource<Key, Value>()
    }
    
    func save(_ value: Value, forKey key: Key) {
        cache.save(value, forKey: key)
    }
    
    func retrieve(forKey key: Key) -> Value? {
        return cache.retrieve(forKey: key)
    }
    
    func removeValue(forKey key: Key) {
        cache.removeValue(forKey: key)
    }
    
    subscript(key: Key) -> Value? {
        get {
            return retrieve(forKey: key)
        }
        set {
            if let value = newValue {
                save(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    func clear() {
        cacheManagerInstances = [:]
    }
}
