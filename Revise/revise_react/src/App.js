import './App.css';
import {SimpleFunction, Introduction} from './Components/Introduction';



function App() {
    return (
        <div className="App">
            <h1>Moja aplikacja React</h1>
            <SimpleFunction/>
            <Introduction name="Janus" age={30}
                        items={[1,2,3,4]}
                        dict={{ phone :"Nokia", car: "MBW"}}/>
        </div>
    );
}

export default App;
