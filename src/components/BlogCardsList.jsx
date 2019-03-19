import React from "react"
import ReactDOM from "react-dom"
import { Card, CardImg, CardText, CardBody,
		 CardTitle, CardSubtitle, Button } from 'reactstrap';

class BlogCardsList extends React.Component{
	constructor(){
		super();
		this.state = {
			blogs: [{}],
			img_path: ""
		}
		let that = this;
		fetch('/api/v1/blogs').then((resp) =>(
			resp.json()
		)).then((json) => {
			that.setState({
				blogs: json.blogs,
				img_path: json.blog_default_img_path
			});
		});
	}
	render(){
		let cards = this.state.blogs.map((v, i) => (
			<Card style={{width: '350px',height: '500px', float: "left"}} key={i}>
				<CardImg top
						 width="200px" height="200px"
						 src={this.state.img_path}	/>
				<CardBody>
					<h3>
						<CardText>
							{v.title}
						</CardText>
					</h3>
					<CardSubtitle>
						{(v.tags_string || "no contents").replace(/<.*?>/, "").substring(0,20)}
					</CardSubtitle>
					<CardText>
						{(v.body || "no contents").replace(/<.*?>/g, "").substring(0,20)}
					</CardText>
					<a href={"/page/" + v.id}>続きを見る</a>
				</CardBody>
			</Card>
		));
		return (
			<div>
				{cards}
			</div>
		);
	}
}
export default BlogCardsList;
