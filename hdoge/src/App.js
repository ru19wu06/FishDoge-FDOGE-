import Hugo from './image/HUGO.jpeg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
      <div className="Hugo_img">
        <img src={Hugo}></img>
      </div>

      <div className="Anot" > 
        <div className="In_Anot" alt="FishDoge Coin">
          <p>FishDoge Coin</p>
        </div>
        <div color="red">
          產量，上限，交易方式
        </div>
      </div>
      </header>
    </div>
  );
}

export default App;
