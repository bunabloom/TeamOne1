//
//  MvListTableViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit
import Kingfisher

final class MvListTableViewCell: UITableViewCell {
  static let id = "MvListTableViewCell"
  
  weak var movieListViewController: MovieListViewController?
  var movies: [MovieListModel] = []
  
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "NanumSquareNeo-dEb", size: 20)
    return lb
  }()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 100, height: 200) // 아이템 높이를 200으로 변경하여 제목을 포함할 수 있게 설정
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(MvCollectionViewCell.self, forCellWithReuseIdentifier: MvCollectionViewCell.id)
    collectionView.showsHorizontalScrollIndicator = false // 스크롤바 숨김 설정
    return collectionView
  }()
  
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    [
      titleLabel,
      collectionView
    ].forEach{contentView.addSubview($0)}
    
    
    titleLabel.snp.makeConstraints {
      $0.top.left.right.equalToSuperview().inset(10)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.left.right.bottom.equalToSuperview().inset(10)
      $0.height.equalTo(200) // 높이를 고정하여 스크롤 문제가 발생하지 않도록 설정
    }
    

  }
  
  func updateCollectionView(with movies: [MovieListModel]) {
    self.movies = movies
    collectionView.reloadData()
  }
}

extension MvListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MvCollectionViewCell.id, for: indexPath) as! MvCollectionViewCell
    let movie = movies[indexPath.item]
    cell.configure(with: movie)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectMovie = movies[indexPath.item]
    movieListViewController?.showMovieDetail(with: selectMovie)
  }
}

//MARK: TableView 셀 안의 CollectionView
class MvCollectionViewCell: UICollectionViewCell {
    static let id = "MvCollectionViewCell"
    
  let imageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 15
    return iv
  }()
  
  let titleLabel = {
    let lb = UILabel()
    lb.textAlignment = .center
    lb.font = UIFont(name: "NanumSquareNeo-dEb", size: 13)
    lb.numberOfLines = 2
    return lb
  }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        
        
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView)
            $0.height.equalTo(contentView.snp.width).multipliedBy(1.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(5)
            $0.leading.equalTo(contentView).offset(5)
            $0.trailing.equalTo(contentView).offset(-5)
            $0.bottom.equalTo(contentView).offset(-5)
        }
    }
    
    func configure(with movie: MovieListModel) {
        if let posterPath = movie.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        titleLabel.text = movie.title
    }
}


final class SearchMovieCollectionViewCell: UICollectionViewCell {
    
    // 영화 포스터이미지를 표시할 이미지 뷰
    let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    // 영화 제목을 표시할 라벨
    let ptTitleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "NanumSquareNeo-cBd", size: 15)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            posterImageView,
            ptTitleLabel].forEach { contentView.addSubview($0) }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        ptTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(90)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: 마이 페이지에 들어갈 CollectionView Cell

class MyPageCollectionViewCell: UICollectionViewCell {
    
    // 마이페이지 컬렉션 뷰 셀에 들어갈 UI 설정
    // 포스터 이미지
    let posterImageView = UIImageView()
        
    // 영화 이름
    let movieLabel = UILabel()
    
    // 영화 상영 날짜
    let movieDate: UILabel = {
        let label = UILabel()
        label.text = "날짜"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    // 영화 상영 시간
    let movieTime: UILabel = {
        let label = UILabel()
        label.text = "시간"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    // 영화 티켓 구매 인원수
    let peopleCount: UILabel = {
        let label = UILabel()
        label.text = "1명"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    // 가격
    let moviePrice: UILabel = {
        let label = UILabel()
        label.text = "14000 원"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 레이아웃 설정
        [posterImageView, movieLabel, movieDate, movieTime, peopleCount, moviePrice].forEach { contentView.addSubview($0) }
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        posterImageView.layer.cornerRadius = 15
        posterImageView.image = UIImage(named: "city")
        
        movieLabel.textAlignment = .center
        movieLabel.font = UIFont.systemFont(ofSize: 12)
        movieLabel.numberOfLines = 2
        movieLabel.text = "범죄도시4"
        
        setUpCellUI()
    }
    private func setUpCellUI() {
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(170)
            $0.width.equalTo(120)
        }
        
        movieLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(posterImageView)
        }
        
        movieDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        movieTime.snp.makeConstraints {
            $0.top.equalTo(movieDate.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        peopleCount.snp.makeConstraints {
            $0.top.equalTo(movieTime.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        moviePrice.snp.makeConstraints {
            $0.top.equalTo(peopleCount.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
