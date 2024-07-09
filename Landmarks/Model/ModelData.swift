

import Foundation





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


// 튜토리얼에서는 아예 전역으로 landmarks 를 불러와서 상시 접근 가능한 데이터로 처리했네. 데이터 크기에 따라 앱 초기화 속도에 영향을 끼칠 수 있지만 튜토리얼이니까 패스.
var landmarks: [Landmark] = load("landmarkData.json")
