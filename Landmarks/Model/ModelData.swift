

import Foundation


// Observable 로 설정하면 데이터 변경이 발생할 때 SwiftUI 의 View 에 변경이 반영 됨
@Observable
class ModelData {
    // landmark 데이터를 Observable 내부로 이동
    var landmarks: [Landmark] = load("landmarkData.json")
    
    // hikeData 로드
    var hikes: [Hike] = load("hikeData.json")
    
    // 기본 Profile.
    var profile = Profile.default
    
    
    // featured landmark 필터링
    var features: [Landmark] {
        landmarks.filter( { $0.isFeatured })
    }
    
    /// category 에 해당하는 랜드마크 리스트 매핑.
    var categories: [String: [Landmark]] {
        Dictionary (
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}



/* json 파일을 읽어서 지정한 타입으로 deserialize 하는 전역 함수. decodable 프로토콜 구현된 타입으로 제한하는 제네릭 처리 */
// 전역 함수로 정의하는 거, 괜찮은지 좀 의문. FileLoadable 같은 protocol 정의하고 Decodable 객체 처리하는 게 어땠을까?
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // 파일 존재 여부 체크
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("FileNotExist error. Couldn't find \(filename) in main bundle")
    }
    
    // 파일 로드
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Load file error. Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // 파일 파싱. JSON 파싱 시도. 타
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Parse file error. Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

