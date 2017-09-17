import React, { Component } from 'react';
import NewSongForm from './components/NewSongForm';
import SongList from './components/SongList';
import axios from 'axios';

class App extends Component {
  state = { songs: [] }

  componentDidMount() {
    axios.get('/api/songs')
      .then( res => this.setState({ songs: res.data }))
  }

  addSong = (name) => {
    const { songs } = this.state;
    axios.post('/api/songs', { song: { name }} )
      .then( res => {
        this.setState({ songs: [res.data, ...songs] })
      })
  }

  updateSong = (id) => {
    axios.put(`/api/songs/${id}`)
      .then( res => {
        let songs = this.state.songs.map( song => {
          if (song.id === id)
            return res.data
          return song
        });

        this.setState({ songs })
      })
  }

  deletesong = (id) => {
    const { songs } = this.state;
    axios.delete(`/api/songs/${id}`)
      .then( res => {
        this.setState({ songs: songs.filter( t => t.id !== id ) })
      })
  }

  render() {
    return (
      <div className="container">
        <NewSongForm addSong={this.addSong} />
        <SongList 
          songs={this.state.songs}
          updatesong={this.updatesong}
          deletesong={this.deletesong}
        />
      </div>
    );
  }
}

export default App;
